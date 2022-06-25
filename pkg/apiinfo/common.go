package apiinfo

import (
	"context"
	"github.com/gendocu-com/rpc-invoker/pkg/utils"
	"go.uber.org/zap"
	"path/filepath"
	"strings"
)

type Selector string
func SelectorMatchServiceName(ctx context.Context, selector Selector, name utils.ServiceName) bool {
	ctx = utils.AddField(ctx, "selector", selector)
	ctx = utils.AddField(ctx, "service_name", name)
	ok, err := filepath.Match(string(selector), string(name))
	if err != nil {
		utils.Logger(ctx).Error("Received an error when matching the service name", zap.Error(err))
		return false
	}
	return ok
}
func FindGrpcUrl(ctx context.Context, urls []string) *utils.GPRCUrl {
	for _, u := range urls {
		if strings.HasPrefix(u, "grpc") && !strings.HasPrefix(u, "grpcweb") {
			x := utils.GPRCUrl(u)
			return &x
		}
	}
	return nil
}
