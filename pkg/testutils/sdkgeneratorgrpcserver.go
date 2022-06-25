package testutils

import (
	"context"
	"fmt"
	"github.com/gendocu-com/rpc-invoker/pkg/utils"
	"google.golang.org/grpc"
	"google.golang.org/grpc/reflection"
	"net"
	v3 "git.gendocu.com/gendocu/GendocuPublicApis.git/sdk/go/gendocu/sdk_generator/v3"
)

func NewSdkGeneratorMock(f func(ctx context.Context, request *v3.BuildSelectorRequest) (*v3.Build, error)) *SdkGeneratorMock {
	return &SdkGeneratorMock{f: f}
}

type SdkGeneratorMock struct {
	v3.UnimplementedSdkGeneratorServer
	f func(ctx context.Context, request *v3.BuildSelectorRequest) (*v3.Build, error)
}

func (s SdkGeneratorMock) GetBuild(ctx context.Context, request *v3.BuildSelectorRequest) (*v3.Build, error) {
	return s.f(ctx, request)
}

func RunSDKGeneratorGrpcServer(port int, f func(ctx context.Context, request *v3.BuildSelectorRequest) (*v3.Build, error), refl bool) (*grpc.Server, utils.GPRCUrl) {
	s := grpc.NewServer()
	v3.RegisterSdkGeneratorServer(s, NewSdkGeneratorMock(f))
	if refl {
		reflection.Register(s)
	}
	url := fmt.Sprintf("localhost:%d", port)
	lis, err := net.Listen("tcp", url)
	if err != nil {
		panic(fmt.Sprintf("failed to listen: %v", err))
	}
	go func() {
		err = s.Serve(lis)
		if err != nil {
			panic(err)
		}
	}()
	return s, utils.GPRCUrl(fmt.Sprintf("grpc://localhost:%d", port))
}
