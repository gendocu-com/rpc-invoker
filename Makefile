
test:
	go test -race ./...
build:
	docker build -t gendocu/rpc-invoker -f Dockerfile .
run: build
	docker run --network host gendocu/rpc-invoker
push: build
	docker push gendocu/rpc-invoker