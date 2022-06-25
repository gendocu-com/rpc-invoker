FROM golang:1.16-buster as builder
ENV GO111MODULE on
# Install also upx to compress the output binary - speeds up cold startup of Docker image
RUN apt-get update && apt-get install -y make git upx ca-certificates

WORKDIR /app
COPY ./go.mod .
COPY ./go.sum .
RUN go mod download

COPY ./cmd ./cmd
COPY ./pkg ./pkg

RUN go build -o grpc-server -ldflags="-s -w" cmd/grpc/main.go && upx grpc-server

FROM debian:buster-slim
RUN apt-get update && apt-get install -y ca-certificates
COPY --from=builder /app/grpc-server /app/grpc-server

#COPY docs/example/library-app.pb /app/library-app.pb
#COPY docs/example/library_app_spec.yaml /app/library_app_spec.yaml
#ENV PB_DESCRIPTOR_FILE_PATH="/app/library-app.pb"
#ENV API_DESCRIPTOR_FILE_PATH="/app/library_app_spec.yaml"

CMD ["/app/grpc-server"]