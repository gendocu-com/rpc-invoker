package apiinfo_test

import (
	"context"
	"github.com/gendocu-com/rpc-invoker/pkg/apiinfo"
	"github.com/gendocu-com/rpc-invoker/pkg/utils"
	"github.com/stretchr/testify/assert"
	"testing"
)

func Test_SelectorMatchServiceName(t *testing.T) {
	t.Parallel()

	tests := []struct{
		testname string
		selector apiinfo.Selector
		serviceName utils.ServiceName
		match bool
	}{
		{"wildcard1", "*", "v1.Service", true},
		{"wildcard2", "v*", "v1.Service", true},
		{"wildcard3", "v1*", "v1.Service", true},
		{"wildcard4", "v1.*", "v1.Service", true},
		{"wildcard5", "*ce", "v1.Service", true},
		{"wildcard6", "v2*", "v1.Service", false},
		{"wildcard7", "*.GrpcWithoutSSL", "v1.GrpcWithoutSSL", true},
		{"fullname", "v1.Service", "v1.Service", true},
		{"prefix", "v1.Serv", "v1.Service", false},
		{"prefix2", "v1.Serv*", "v1.Service", true},
	}
	for _, tt := range tests {
		tt := tt
		t.Run(tt.testname, func(t *testing.T) {
			t.Parallel()
			ctx := context.Background()

			res := apiinfo.SelectorMatchServiceName(ctx, tt.selector, tt.serviceName)

			assert.Equal(t, res, tt.match)
		})
	}
}

func Test_FindGrpcUrl(t *testing.T) {
	t.Parallel()

	tests := []struct{
		url string
		match bool
	}{
		{"grpc://google.com", true},
		{"grpcs://google.com", true},
		{"grpcweb://google.com", false},
		{"grpcwebs://google.com", false},
		{"rests://google.com", false},
		{"https://google.com", false},
		{"http://google.com", false},
		{"ftp://google.com", false},
	}
	for _, test := range tests {
		test := test
		t.Run(test.url, func(t *testing.T) {
			t.Parallel()
			ctx := context.Background()

			res := apiinfo.FindGrpcUrl(ctx, []string{test.url})

			assert.Equal(t, test.match, res != nil)
		})
	}
}