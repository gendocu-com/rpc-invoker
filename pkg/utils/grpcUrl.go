package utils

import (
	"context"
	"go.uber.org/zap"
	"net/url"
	"strings"
)

type GPRCUrl string

func (g *GPRCUrl) GrpcDialUrl(ctx context.Context) (string, error) {
	u := g.url(ctx)
	p := g.port(ctx)
	x, err := url.Parse("https://" + u)
	if err != nil {
		Logger(ctx).Error("received an error while building dial grpc url", zap.Error(err), zap.Reflect("url", u),
			zap.Reflect("port", p))
		return "", err
	}
	x.Host += ":" + p
	x.Scheme = ""
	els := []string{x.Host}
	if len(x.Path) > 0 && x.Path[0] == '/' {
		x.Path = x.Path[1:]
	}
	if x.Path != "" {
		els = append(els, x.Path)
	}
	return strings.Join(els, "/"), nil
}

func (g *GPRCUrl) port(ctx context.Context) string {
	defPort := "443"
	if !g.SSLEnabled() {
		defPort = "80"
	}
	u := string(*g)
	x, err := url.Parse(u)
	if err != nil {
		Logger(ctx).Error("grpcs port error", zap.Error(err), zap.Reflect("url", g))
	}
	if len(x.Port()) == 0 {
		return defPort
	} else {
		return x.Port()
	}
}

func (g *GPRCUrl) url(ctx context.Context) string {
	a, err := url.Parse(string(*g))
	if err != nil {
		Logger(ctx).Error("received an error while parsing grpcurl", zap.Error(err), zap.Reflect("url", *g))
	}
	a.Scheme = ""
	if a.Port() != "" {
		a.Host = a.Host[:len(a.Host)-len(":"+a.Port())]
	}
	if len(a.Path) > 0 && a.Path[0] == '/' {
		a.Path = a.Path[1:]
	}
	els := []string{a.Host}
	if a.Path != "" {
		els = append(els, a.Path)
	}
	return strings.Join(els, "/")
}

func (g *GPRCUrl) SSLEnabled() bool {
	return strings.HasPrefix(string(*g), "grpcs")
}
