package utils

import (
	"context"
	validate "github.com/go-playground/validator/v10"
	"github.com/spf13/viper"
	"reflect"
	"sync"
)

type Config struct {
	GRPCPort              uint   `mapstructure:"PORT" validate:"required" default:"7050"`
	PBDescriptorFilePath  string `mapstructure:"PB_DESCRIPTOR_FILE_PATH" default:"/app/app_spec.pb"`
	ApiDescriptorFilePath string `mapstructure:"API_DESCRIPTOR_FILE_PATH" default:"/app/app_spec.yaml"`
	GRPCCallTimeout       int    `mapstructure:"GRPC_CALL_TIMEOUT_S" validate:"required" default:"10"`
	GRPCConnectTimeout    int    `mapstructure:"GRPC_CONNECT_TIMEOUT_S" validate:"required" default:"10"`
	LoggerJSONEncoding    bool   `mapstructure:"LOGGER_JSON_ENCODING" default:"true"`
	LoggerDebugEnabled    bool   `mapstructure:"LOGGER_DEBUG_ENABLED" default:"true"`
	SSLCertificate        string `mapstructure:"SSL_CERTIFICATE" default:"/app/cert.pem"`
	SSLKey                string `mapstructure:"SSL_KEY" default:"/app/privkey.pem"`
	NoSSL                 bool   `mapstructure:"NO_SSL" default:"false"`
}

var mtx sync.Mutex

func LoadConfig(ctx context.Context) (cfg Config) {
	mtx.Lock()
	defer mtx.Unlock()
	viper.SetConfigType("env")
	viper.AutomaticEnv()
	ref := reflect.TypeOf(cfg)
	for i := 0; i < ref.NumField(); i++ {
		field := ref.Field(i)
		viper.SetDefault(field.Tag.Get("mapstructure"), field.Tag.Get("default"))
	}
	err := viper.Unmarshal(&cfg)
	if err != nil {
		panic(err)
	}
	err = validate.New().Struct(cfg)
	if err != nil {
		panic(err)
	}
	return cfg
}
