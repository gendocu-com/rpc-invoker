package rpcinvoker

import (
	"bytes"
	"context"
	"crypto/tls"
	"crypto/x509"
	"fmt"
	v1 "git.gendocu.com/gendocu/GendocuPublicApis.git/sdk/go/gendocu/rpc_invoker/v1"
	"github.com/gendocu-com/rpc-invoker/pkg/utils"
	"strings"
	"time"

	"github.com/google/uuid"

	"google.golang.org/grpc"

	"google.golang.org/protobuf/types/descriptorpb"

	"github.com/fullstorydev/grpcurl"
	"go.uber.org/zap"
	"google.golang.org/grpc/codes"
	"google.golang.org/grpc/credentials"
	"google.golang.org/grpc/status"
)

type DocRepo interface {
	GetUrl(ctx context.Context, buildId utils.BuildId, serviceName utils.ServiceName, envName utils.EnvName) (*utils.GPRCUrl, error)
}
type ProtosetRepo interface {
	GetProtoset(ctx context.Context, buildId utils.BuildId) (*descriptorpb.FileDescriptorSet, error)
}

func NewService(
	repo DocRepo,
	protoRepo ProtosetRepo,
	connectTimeout int,
	callTimeout int,
) *Service {
	return &Service{
		repo:           repo,
		protoRepo:      protoRepo,
		connectTimeout: time.Duration(connectTimeout) * time.Second,
		callTimeout:    time.Duration(callTimeout) * time.Second,
	}
}

type Service struct {
	v1.UnimplementedRpcInvokerServer
	repo           DocRepo
	protoRepo      ProtosetRepo
	connectTimeout time.Duration
	callTimeout    time.Duration
}

func (s Service) InvokeMethod(ctx context.Context, request *v1.InvokeMethodRequest) (_ *v1.InvokeMethodResponse, err error) {
	buildId := utils.BuildId(request.BuildId)
	debugToken := uuid.NewString()
	ctx = utils.AddField(ctx, "debug_token", debugToken)
	ctx = utils.AddBuildId(ctx, buildId)
	ctx = utils.AddEnvironmentName(ctx, utils.EnvName(request.Environment))
	ctx = utils.AddField(ctx, "service_name", request.ServiceId)
	targetUrl, err := s.repo.GetUrl(ctx, buildId, utils.ServiceName(request.ServiceId), utils.EnvName(request.Environment))
	if err != nil {
		utils.Logger(ctx).Error("Unable to get an url for selected service", zap.Error(err))
		return nil, err
	}
	if targetUrl == nil || *targetUrl == "" {
		return nil, status.Error(codes.InvalidArgument, fmt.Sprintf("Environment %v has unset grpc address", request.Environment))
	}
	var creds credentials.TransportCredentials
	if targetUrl.SSLEnabled() {
		utils.Logger(ctx).Debug("Adding SSL credentials to call")
		creds, err = getSSLGrpcOptions()
		if err != nil {
			utils.Logger(ctx).Error("received an error while getting ssl options", zap.Error(err))
			return nil, status.Error(codes.Internal, "pkg error")
		}
	}
	var fileSource grpcurl.DescriptorSource
	utils.Logger(ctx).Debug("fetching the protoset")
	if protoset, err := s.protoRepo.GetProtoset(ctx, buildId); err == nil && protoset != nil {
		fileSource, err = grpcurl.DescriptorSourceFromFileDescriptorSet(protoset)
		if err != nil {
			utils.Logger(ctx).Error("Received an error while builing File Descriptor Set for API", zap.Error(err))
			return nil, err
		}
	} else {
		utils.Logger(ctx).Error("unable to get protoset", zap.Error(err), zap.Reflect("buildId", request.BuildId))
		return nil, fmt.Errorf("unable to find grpc api description")
	}
	ctxCon, cancel := context.WithTimeout(ctx, s.connectTimeout)
	defer cancel()
	dialUrl, err := targetUrl.GrpcDialUrl(ctx)
	if err != nil {
		utils.Logger(ctx).Error("unable to parse the url", zap.Error(err), zap.Reflect("targetUrl", dialUrl))
		return nil, fmt.Errorf("unable to parse url")
	}
	utils.Logger(ctx).Debug("dialing grpc", zap.Reflect("url", dialUrl))
	var opts []grpc.DialOption
	cc, err := grpcurl.BlockingDial(ctxCon, "tcp", dialUrl, creds, opts...)
	if err != nil {
		utils.Logger(ctx).Error("server did not respond",
			zap.Error(err),
			zap.Reflect("targetUrl", dialUrl),
		)
		return nil, err
	}
	utils.Logger(ctx).Debug(fmt.Sprintf("connection with %v established", dialUrl))
	defer func() {
		err := cc.Close()
		if err != nil {
			utils.Logger(ctx).Error("received an error while closing the connection", zap.Error(err))
		}
	}()
	options := grpcurl.FormatOptions{}
	utils.Logger(ctx).Debug("creating new client")
	rf, formatter, err := grpcurl.RequestParserAndFormatter("json", fileSource, strings.NewReader(request.GetBody()), options)
	if err != nil {
		return nil, err
	}
	buf := bytes.NewBuffer([]byte{})
	h := &grpcurl.DefaultEventHandler{
		Out:       buf,
		Formatter: formatter,
	}
	mid := request.GetMethodId()
	if strings.HasPrefix(mid, request.GetServiceId()) {
		mid = mid[len(request.GetServiceId())+1:]
	}
	sid := request.GetServiceId()
	if sid[0] == '.' {
		sid = sid[1:]
	}
	hs := []string{
		fmt.Sprintf("proxy-request-id: %v", debugToken),
		"request-source:gendocu-proxy",
	}
	for _, header := range request.GetHeaders() {
		if header.Name != "" && header.Value != "" {
			hs = append(hs, header.Name+":"+header.Value)
		}
	}
	ctxCall, cancelCall := context.WithTimeout(ctx, s.callTimeout)
	defer cancelCall()
	utils.Logger(ctx).Debug("Sending gRPC request",
		zap.Reflect("url", targetUrl),
		zap.Reflect("service_id", sid),
		zap.Reflect("method_id", mid),
	)
	err = grpcurl.InvokeRPC(ctxCall, fileSource, cc, fmt.Sprintf("%v/%v", sid, mid), hs, h, rf.Next)
	if err != nil {
		utils.Logger(ctx).Error("received error while invoking the method", zap.Error(err))
		if ctxCall.Err() != nil {
			return nil, status.Error(codes.DeadlineExceeded, "target service has not responded in given time frame")
		}
		return nil, status.Error(codes.InvalidArgument, fmt.Sprintf("target service responded with error: %v", err))
	}
	if h.Status.Code() == 4 && h.Status.Message() == "context deadline exceeded" {
		if len(buf.String()) > 0 {
			return &v1.InvokeMethodResponse{
				Response:          buf.String(),
				ResponseCode:      int32(h.Status.Code()),
				ResponseMessage:   "Service did not finish in the 10 seconds - forcing close.",
				RequestDebugToken: debugToken,
			}, nil
		} else {
			return &v1.InvokeMethodResponse{
				Response:          buf.String(),
				ResponseCode:      int32(h.Status.Code()),
				ResponseMessage:   "Service did not respond in 10 seconds.",
				RequestDebugToken: debugToken,
			}, nil
		}
	}
	resp := &v1.InvokeMethodResponse{
		Response:          buf.String(),
		ResponseCode:      int32(h.Status.Code()),
		ResponseMessage:   cleanStatusMessage(h.Status.Message()),
		RequestDebugToken: debugToken,
	}
	return resp, nil
}

func cleanStatusMessage(s string) string {
	const p = "Error: "
	if strings.HasPrefix(s, p) {
		return s[len(p):]
	}
	return s
}
func getSSLGrpcOptions() (credentials.TransportCredentials, error) {
	systemRoots, err := x509.SystemCertPool()
	if err != nil {
		return nil, err
	}
	cred := credentials.NewTLS(&tls.Config{
		RootCAs: systemRoots,
	})
	return cred, err

}
