package apiinfo_test

import (
	"context"
	"github.com/gendocu-com/rpc-invoker/pkg/apiinfo"
	"github.com/gendocu-com/rpc-invoker/pkg/utils"
	"github.com/stretchr/testify/assert"
	"path/filepath"
	"testing"
)

func Test_GetUrl(t *testing.T) {
	t.Parallel()
	ctx := context.Background()
	s, err := apiinfo.NewFile(ctx, filepath.Join("testdata/config.yaml"))
	if !assert.NoError(t, err) {
		return
	}

	tests := []struct{
		name string
		serviceName utils.ServiceName
		env utils.EnvName
		url string
	}{
		{"insecure", "v1.GrpcWithoutSSL", "grpc", "grpc://tmp.com"},
		{"secure", "v1.GrpcWithSSL", "grpc", "grpcs://tmp.com"},
		{"grpcweb", "v1.GrpcWebOnly", "env", ""},
		{"rest", "v1.RestOnly", "env", ""},
		{"invalid_env", "v1.GrpcWitSSL", "dev", ""},
		{"invalid_service", "v1.GrpcWitSSL2", "grpc", ""},
		{"service_with_wildcard", "v1.GrpcWitS*", "grpc", ""},
	}
	for _, tt := range tests {
		tt := tt
		t.Run(tt.name, func(t *testing.T) {
			t.Parallel()

			res, err := s.GetUrl(ctx, "", tt.serviceName, tt.env)

			if tt.url == "" {
				assert.Error(t, err)
				assert.Nil(t, res)
			} else {
				if assert.NoError(t, err) {
					assert.EqualValues(t, tt.url, string(*res))
				}
			}
		})
	}


}