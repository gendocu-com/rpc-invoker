// Code generated by mockery v0.0.0-dev. DO NOT EDIT.

package mocks

import (
	context "context"

	mock "github.com/stretchr/testify/mock"
	descriptorpb "google.golang.org/protobuf/types/descriptorpb"

	utils "github.com/gendocu-com/rpc-invoker/pkg/utils"
)

// ProtosetRepo is an autogenerated mock type for the ProtosetRepo type
type ProtosetRepo struct {
	mock.Mock
}

// GetProtoset provides a mock function with given fields: ctx, buildId
func (_m *ProtosetRepo) GetProtoset(ctx context.Context, buildId utils.BuildId) (*descriptorpb.FileDescriptorSet, error) {
	ret := _m.Called(ctx, buildId)

	var r0 *descriptorpb.FileDescriptorSet
	if rf, ok := ret.Get(0).(func(context.Context, utils.BuildId) *descriptorpb.FileDescriptorSet); ok {
		r0 = rf(ctx, buildId)
	} else {
		if ret.Get(0) != nil {
			r0 = ret.Get(0).(*descriptorpb.FileDescriptorSet)
		}
	}

	var r1 error
	if rf, ok := ret.Get(1).(func(context.Context, utils.BuildId) error); ok {
		r1 = rf(ctx, buildId)
	} else {
		r1 = ret.Error(1)
	}

	return r0, r1
}
