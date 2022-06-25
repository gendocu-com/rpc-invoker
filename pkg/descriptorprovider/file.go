package descriptorprovider

import (
	"context"
	"github.com/gendocu-com/rpc-invoker/pkg/utils"
	"github.com/golang/protobuf/proto"
	"go.uber.org/zap"
	"google.golang.org/grpc/codes"
	"google.golang.org/grpc/status"
	"google.golang.org/protobuf/types/descriptorpb"
	"io/ioutil"
)

func NewFile(ctx context.Context, path string) (*File, error) {
	if path == "" {
		return nil, status.Error(codes.FailedPrecondition, "Provided empty path to API Proto Descriptor Set file")
	}
	ctx = utils.AddField(ctx, "descriptor_pb_path", path)
	b, err := ioutil.ReadFile(path)
	if err != nil {
		utils.Logger(ctx).Error("got an error while reading the file",
			zap.Error(err))
		return nil, err
	}
	fds := &descriptorpb.FileDescriptorSet{}
	err = proto.Unmarshal(b, fds)
	if err != nil {
		utils.Logger(ctx).Error("Unable to decode the file descriptor set", zap.Error(err))
		return nil, err
	}
	var serviceFiles, fileName, services []string
	for _, descriptorProto := range fds.File {
		if len(descriptorProto.Service) > 0 {
			serviceFiles = append(serviceFiles, descriptorProto.GetName())
			for _, serviceDescriptorProto := range descriptorProto.Service {
				services = append(services, descriptorProto.GetPackage() + "." + serviceDescriptorProto.GetName())
			}
		}
		fileName = append(fileName, descriptorProto.GetName())
	}
	utils.Logger(ctx).Debug("Provided pb descriptor",
		zap.Int("service_files_cnt", len(serviceFiles)),
		zap.Reflect("services", services),
		zap.Reflect("service_files", serviceFiles),
		zap.Reflect("total_files", len(fileName)),
	)
	return &File{
		path: path,
		fileDescriptorSet: fds,
	}, nil
}

type File struct {
	fileDescriptorSet *descriptorpb.FileDescriptorSet
	path              string
}

func (f File) GetProtoset(ctx context.Context, buildId utils.BuildId) (*descriptorpb.FileDescriptorSet, error) {
	ctx = utils.AddField(ctx, "descriptor_pb_path", f.path)
	if f.fileDescriptorSet == nil {
		return nil, status.Error(codes.Internal, "Unable to return protoset - protoset was not loaded correctly")
	}
	return f.fileDescriptorSet, nil
}



