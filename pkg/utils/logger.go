package utils

import (
	"context"
	"go.uber.org/zap"
)

const LoggerKey = "logger"
func Logger(ctx context.Context) *zap.Logger {
	v := ctx.Value(LoggerKey)
	l, ok := v.(*zap.Logger)
	if !ok || v == nil {
		return buildLogger(ctx, true, true)
	}
	return l
}
func AddLogger(ctx context.Context, cfg Config) context.Context {
	l := buildLogger(ctx, cfg.LoggerJSONEncoding, cfg.LoggerDebugEnabled)
	ctx = context.WithValue(ctx, LoggerKey, l)
	return ctx
}

func AddBuildId(ctx context.Context, value BuildId) context.Context {
	l := Logger(ctx)
	l.With(zap.Reflect("build_id", value))
	ctx = context.WithValue(ctx, LoggerKey, l)
	return ctx
}

func AddEnvironmentName(ctx context.Context, value EnvName) context.Context {
	l := Logger(ctx)
	l.With(zap.Reflect("environment_name", value))
	ctx = context.WithValue(ctx, LoggerKey, l)
	return ctx
}

func AddField(ctx context.Context, name string, value interface{}) context.Context {
	l := Logger(ctx)
	l.With(zap.Reflect(name, value))
	ctx = context.WithValue(ctx, LoggerKey, l)
	return ctx
}

func buildLogger(ctx context.Context, jsonEncoding bool, debugEnabled bool) *zap.Logger {
	config := zap.NewProductionConfig()
	config.Encoding = "console"
	if jsonEncoding {
		config.Encoding = "json"
	}
	if debugEnabled {
		config.Level = zap.NewAtomicLevelAt(zap.DebugLevel)
	}
	logger, err := config.Build()
	if err != nil {
		panic(err)
	}
	if logger == nil {
		panic("empty logger")
	}
	return logger
}