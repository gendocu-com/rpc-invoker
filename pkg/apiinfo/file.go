package apiinfo

import (
	"context"
	"github.com/gendocu-com/rpc-invoker/pkg/utils"
	"go.uber.org/zap"
	"google.golang.org/grpc/codes"
	"google.golang.org/grpc/status"
	"gopkg.in/yaml.v2"
	"io/ioutil"
)

func NewFile(ctx context.Context, path string) (*File, error) {
	if path == "" {
		return nil, status.Error(codes.FailedPrecondition, "Provided empty path to API Specification File")
	}
	ctx = utils.AddField(ctx, "apispec_filepath", path)
	b, err := ioutil.ReadFile(path)
	if err != nil {
		utils.Logger(ctx).Error("Unable to read file", zap.Error(err))
		return nil, err
	}
	var cf ConfigFile
	err = yaml.Unmarshal(b, &cf)
	if err != nil {
		utils.Logger(ctx).Error("Unable to unmarshal file", zap.Error(err))
		return nil, err
	}
	return NewFileFromMemory(ctx, cf, path)
}
func NewFileFromMemory(ctx context.Context, cf ConfigFile, path string) (*File, error) {
	if cf.CountUrls() == 0 {
		utils.Logger(ctx).Error("The loaded config has no urls")
		return nil, status.Error(codes.FailedPrecondition, "The provided apispec file does not contain any url!")
	}
	envs := map[utils.EnvName]bool{}
	for _, server := range cf.Server {
		for _, env := range server.Envs {
			envs[env.Name] = true
		}
	}
	var envsAsStr []utils.EnvName
	for name, _ := range envs {
		envsAsStr = append(envsAsStr, name)
	}
	utils.Logger(ctx).Debug("Received description for environments", zap.Reflect("environments", envsAsStr))
	return &File{
		configFile: cf,
		filePath: path,
	}, nil
}

type File struct {
	configFile ConfigFile
	filePath   string
}

func (s File) GetUrl(ctx context.Context, buildId utils.BuildId, serviceName utils.ServiceName, envName utils.EnvName) (*utils.GPRCUrl, error) {
	ctx = utils.AddField(ctx, "serviceName", serviceName)
	ctx = utils.AddField(ctx, "envName", envName)
	ctx = utils.AddField(ctx, "buildId", buildId)
	if buildId != "" {
		utils.Logger(ctx).Info("API Information provider ignore the build id, as you provided API specification file",
			zap.Reflect("file_path", s.filePath))
	}
	server := s.findServer(ctx, serviceName)
	if server == nil {
		utils.Logger(ctx).Error("Unable to find server definition for service")
		return nil, status.Errorf(codes.InvalidArgument, "Unable to find url for service %v", serviceName)
	}
	env := s.findEnv(ctx, server, envName)
	if env == nil {
		utils.Logger(ctx).Error("Unable to find environment definition for service")
		return nil, status.Errorf(codes.InvalidArgument, "Unable to find environment %v for service %v", envName, serviceName)
	}
	url := FindGrpcUrl(ctx, env.Urls)
	if url == nil {
		utils.Logger(ctx).Error("Unable to find gRPC Url in given env for service", zap.Reflect("urls", env.Urls))
		return nil, status.Errorf(codes.InvalidArgument, "Unable to find gRPC Url in '%v' env for service %v", envName, serviceName)

	}
	return url, nil
}
func (s File) findEnv(ctx context.Context, server *ConfigFile_Server, envName utils.EnvName) *ConfigFile_Server_Env {
	for _, env := range server.Envs {
		if env.Name == envName {
			return &env
		}
	}
	return nil
}
func (s File) findServer(ctx context.Context, serviceName utils.ServiceName) *ConfigFile_Server {
	for _, server := range s.configFile.Server {
		if SelectorMatchServiceName(ctx, server.Selector, serviceName) {
			return &server
		}
	}
	return nil
}



// ConfigFile is incomplete structure for gendocu api spec file. It contains only url data necessary to perform rpc call.
type ConfigFile struct {
	Server []ConfigFile_Server `yaml:"servers"`
}
type ConfigFile_Server struct {
	Selector Selector                `yaml:"selector"`
	Envs     []ConfigFile_Server_Env `yaml:"envs"`
}
type ConfigFile_Server_Env struct {
	Name utils.EnvName `yaml:"name"`
	Urls []string `yaml:"urls"`
}

func (c ConfigFile) CountUrls() int {
	cnt := 0
	for _, server := range c.Server {
		for _, env := range server.Envs {
			cnt += len(env.Urls)
		}
	}
	return cnt
}