package pkg

import (
	"context"
	v12 "git.gendocu.com/gendocu/GendocuPublicApis.git/sdk/go/gendocu/rpc_invoker/v1"
	"github.com/gendocu-com/rpc-invoker/pkg/apiinfo"
	"github.com/gendocu-com/rpc-invoker/pkg/descriptorprovider"
	"github.com/gendocu-com/rpc-invoker/pkg/utils"
	"github.com/gendocu-com/rpc-invoker/pkg/rpcinvoker"
	grpc_middleware "github.com/grpc-ecosystem/go-grpc-middleware"
	"google.golang.org/grpc"
)

func NewFactory(cfg utils.Config) *Factory {
	return &Factory{
		cfg: cfg,
	}
}

type Factory struct {
	cfg utils.Config
}

func (f Factory) NewGrpcServer(ctx context.Context) (*grpc.Server, error) {
	grpcServer := grpc.NewServer(grpc.UnaryInterceptor(
		grpc_middleware.ChainUnaryServer(),
	))
	s, err := f.NewRPCInvokerServer(ctx)
	if err != nil {
		return nil, err
	}
	v12.RegisterRpcInvokerServer(grpcServer, s)
	return grpcServer, nil
}
func (f Factory) NewDescriptorProviderFromFile(ctx context.Context) (*descriptorprovider.File, error) {
	d, err := descriptorprovider.NewFile(ctx, f.cfg.PBDescriptorFilePath)
	if err != nil {
		return nil, err
	}
	return d, nil
}
func (f Factory) NewRPCInvokerServer(ctx context.Context) (*rpcinvoker.Service, error) {
	d, err := f.NewDescriptorProviderFromFile(ctx)
	a, err := apiinfo.NewFile(ctx, f.cfg.ApiDescriptorFilePath)
	if err != nil {
		return nil, err
	}
	return rpcinvoker.NewService(
		a,
		d,
		f.cfg.GRPCCallTimeout,
		f.cfg.GRPCConnectTimeout,
	), nil
}

