package rpcinvoker_test

import (
	"context"
	"fmt"
	v1 "git.gendocu.com/gendocu/GendocuPublicApis.git/sdk/go/gendocu/rpc_invoker/v1"
	v3 "git.gendocu.com/gendocu/GendocuPublicApis.git/sdk/go/gendocu/sdk_generator/v3"
	"github.com/gendocu-com/rpc-invoker/pkg/apiinfo"
	"github.com/gendocu-com/rpc-invoker/pkg/descriptorprovider"
	"github.com/gendocu-com/rpc-invoker/pkg/rpcinvoker"
	"github.com/gendocu-com/rpc-invoker/pkg/testutils"
	"github.com/gendocu-com/rpc-invoker/pkg/utils"
	"github.com/google/uuid"
	"github.com/stretchr/testify/assert"
	"google.golang.org/grpc/metadata"
	"path/filepath"
	"testing"
)

func TestService_InvokeMethod(t *testing.T) {
	t.Parallel()
	// Given
	ctx := context.Background()
	var (
		port = 7300
		headerName, headerValue = "Name"+uuid.NewString(), "Value"+uuid.NewString()
		buildId = utils.BuildId(uuid.NewString())
		serviceId = utils.ServiceName("gendocu.sdk_generator.v3.SdkGenerator")
		envName = utils.EnvName("grpc")
	)
	called, passed := false, false
	server, url := testutils.RunSDKGeneratorGrpcServer(port, func(ctx context.Context, request *v3.BuildSelectorRequest) (*v3.Build, error) {
		called = true
		md, ok := metadata.FromIncomingContext(ctx)
		if !ok {
			return nil, fmt.Errorf("unable to get metadata from context")
		}
		x := md.Get(headerName)
		if len(x) != 1 || x[0] != headerValue {
			return nil, fmt.Errorf("value mismatch, got %+v, but expected %v", x, headerValue)
		}
		passed = true
		return &v3.Build{BuildId: string(buildId)}, nil
	}, true)
	dp, err :=  descriptorprovider.NewFile(ctx, filepath.Join("testdata", "gendocu-public-api.pb"))
	if !assert.NoError(t, err) {
		return
	}
	af, err := apiinfo.NewFileFromMemory(ctx, apiinfo.ConfigFile{
		Server: []apiinfo.ConfigFile_Server{
			{Selector: "*", Envs: []apiinfo.ConfigFile_Server_Env{
				{Name: envName, Urls: []string{string(url)}},
			}},
		},
	}, "")
	if !assert.NoError(t, err) {
		return
	}
	s := rpcinvoker.NewService(
		af,
		dp,
	)
	if !assert.NoError(t, err) {
		return
	}

	// When
	resp, err := s.InvokeMethod(context.Background(), &v1.InvokeMethodRequest{
		ServiceId:   string(serviceId),
		MethodId:    "GetBuild",
		Environment: string(envName),
		Body:        "{\"build_id\": \"01FDHBYTKS2YX1SS9GX3RKNSGM\"}",
		Headers: []*v1.Header{
			{Name: headerName, Value: headerValue},
		},
		BuildId: string(buildId),
	})
	server.Stop()

	// Then
	assert.NoError(t, err)
	assert.True(t, called)
	assert.True(t, passed)
	if assert.NotEmpty(t, resp.GetResponse()) {
	}
}

