package main

import (
	"context"
	"fmt"
	"github.com/gendocu-com/rpc-invoker/pkg"
	"github.com/gendocu-com/rpc-invoker/pkg/utils"
	"github.com/improbable-eng/grpc-web/go/grpcweb"
	"go.uber.org/zap"
	"net/http"
	"strings"
	"time"
)

func main() {
	ctx := context.Background()
	cfg := utils.LoadConfig(ctx)
	ctx = utils.AddLogger(ctx, cfg)
	f := pkg.NewFactory(cfg)
	utils.Logger(ctx).Debug("Building grpc service")
	grpcServer, err := f.NewGrpcServer(ctx)
	if err != nil {
		utils.Logger(ctx).Fatal("Unable to build grpc service- check the configuration", zap.Error(err))
	}
	grpcWebServer := grpcweb.WrapServer(grpcServer, grpcweb.WithWebsockets(true))
	utils.Logger(ctx).Debug("Building server", zap.Reflect("port", cfg.GRPCPort))
	server := &http.Server{
		ReadHeaderTimeout: 10 * time.Second,
		IdleTimeout: 120*time.Second,
		Addr: fmt.Sprintf(":%d", cfg.GRPCPort),
		Handler: http.HandlerFunc(func(writer http.ResponseWriter, request *http.Request) {
			if request.Method == http.MethodOptions {
				writer.Header().Set("Access-Control-Allow-Origin", "*")
				writer.Header().Set("Access-Control-Allow-Methods", "GET, POST, DELETE, OPTIONS")
				writer.Header().Set("Access-Control-Allow-Headers", "*")
				writer.WriteHeader(http.StatusOK)
				return
			}
			if strings.Contains(request.Header.Get("Content-Type"), "application/grpc") {
				utils.Logger(ctx).Debug("Got gRPC Request", zap.Reflect("uri", request.RequestURI))
				writer.Header().Set("Access-Control-Allow-Origin", "*")
				writer.Header().Set("Access-Control-Allow-Methods", "GET, POST, DELETE, OPTIONS")
				writer.Header().Set("Access-Control-Allow-Headers", "*")
				grpcWebServer.ServeHTTP(writer, request)
			} else {
				utils.Logger(ctx).Debug("Got gRPC Request", zap.Reflect("uri", request.RequestURI))
				grpcServer.ServeHTTP(writer, request)
			}
		}),
	}
	if !cfg.NoSSL {
		utils.Logger(ctx).Debug("Starting gRPC Server with SSL",
			zap.Reflect("port", cfg.GRPCPort),
			zap.Reflect("cert_path", cfg.SSLCertificate),
			zap.Reflect("cert_key", cfg.SSLKey),
		)
		err = server.ListenAndServeTLS(cfg.SSLCertificate, cfg.SSLKey)
		if err != nil {
			utils.Logger(ctx).Fatal("received an error from server", zap.Error(err))
		}

	} else {
		utils.Logger(ctx).Warn("SSL-related environment variables are not set. We recommend to use this service with SSL enabled. Just set SSL_CERTIFICATE and SSL_KEY to enable ssl.")
		utils.Logger(ctx).Debug("Starting gRPC Server with no SSL", zap.Reflect("port", cfg.GRPCPort))
		err = server.ListenAndServe()
		if err != nil {
			utils.Logger(ctx).Fatal("received an error from server", zap.Error(err))
		}
	}
}