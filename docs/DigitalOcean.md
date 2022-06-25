# Private gRPC Cluster on Digital Ocean

To make your private gRPC API accessible from the GenDocu's documentation, you need to deploy the proxy - `rpc-invoker`
that converts the browser-friendly request to a native gRPC request.

1. `rpc-invoker` must be accessible from your browser via `https`. It might require using VPN or any other solution to provide your browser access to rpc-invoker.
2. `rpc-invoker` must have access to the gRPC service.
3. (optionally, to be implemented) `rpc-invoker` must have access to `gendocu.com` service via the internet to download the newest API definition.
You can also manually mount a file with the API definition, which requires manual API Definition updates.

In this tutorial, you will:
1. Deploy our "Library App" gRPC Service. You can find the repository [here](https://github.com/gendocu-com-examples/library-app). You can replace it with your gRPC Service.
2. Deploy our gRPC Proxy `rpc-invoker` that converts browser-friendly requests from the documentation.
3. Create documentation that can call the gRPC endpoint in your private network.

## Deploy example/your gRPC service

1. Create a new Droplet (server) with Linux/Ubuntu system. Copy the private IP.
2. [Install docker](https://docs.docker.com/engine/install/ubuntu/)
3. Run the library app: `docker run -e PORT=81 --network host gendocu/library-app`

## Deploy RPC Invoker

1. Create a new Droplet (server) with Linux/Ubuntu system in the same VPC as the target gRPC service.
   The RPC Invoker needs to have access to the gRPC service. 
   Make also sure that the RPC Invoker can be accessed from your browser. 
2. [Install docker](https://docs.docker.com/engine/install/ubuntu/)
3. Connect a domain with SSL to your server - make rpc-invoker accessible with `https` protocol. In the next step, we mount the SSL certificates to the docker instance.
4. (this step won't be required in the future) Download your gRPC API File Descriptor and API Specification. 
   You can find the gRPC API File Descriptor in the project's SDK repository: `sdk/grpc-descriptor.pb`, e.g., [docs/example/library-app.pb](docs/example/library-app.pb).
   API Specification is a file that GenDocu uses to get the URL specification. It should be located in your proto source repository, e.g., [docs/example/library_app_spec.yaml](docs/example/library_app_spec.yaml). 
5. Run the rpc invoker:
```bash
docker run --network host -e PORT=443 \
  --mount type=bind,source=$PWD/library_app_spec.yaml,target=/app/app_spec.yaml \
  --mount type=bind,source=$PWD/library-app.pb,target=/app/app_spec.pb \
  --mount type=bind,source=/etc/letsencrypt/live/test-domain.gendocu.com/cert.pem,target=/app/cert.pem \
  --mount type=bind,source=/etc/letsencrypt/live/test-domain.gendocu.com/privkey.pem,target=/app/privkey.pem \
  gendocu/rpc-invoker
```

### Using RPC Invoker without SSL

It is possible to use the RPC invoker without an SSL certificate - set environment variable `NoSSL=true`.

1. Expose the rpc-invoker via reverse-proxy that would handle HTTPS connection with a client, and then forward HTTP request to rpc-invoker
2. It is also possible to turn off the SSL validation in the browser, but we do not recommend it.


## Test the integration

1. Fork our sample project [library-app](https://github.com/gendocu-com-examples/library-app)
2. In the `proto/gendocu_apispec.yaml` replace the server URL with the one you already created:
```yaml
servers:
  - selector: "*" # the * must be wrapped with ""
    envs:
    - name: "private" # the first environment is the default one
      proxy: <rpc-invoker-url>
      urls:
      - grpc://<private-api> # grpc for non-ssl connection, and grpcs for ssl connection
```
in our case definition looks like this:
```yaml
servers:
  - selector: "*" # the * must be wrapped with ""
    envs:
    - name: "private" # the first environment is the default one
      proxy: https://test-domain.gendocu.com:443
      urls:
      - grpc://10.135.0.3:81
```
3. Create new API in [GenDocu Console](https://console.gendocu.com)
4. Open the documentation and call the rpc endpoint. Example output from `rpc-invoker`:
```bash
{"level":"debug","ts":1656445785.5353973,"caller":"grpc/main.go:20","msg":"Building grpc service"}
{"level":"debug","ts":1656445785.5369875,"caller":"descriptorprovider/file.go:41","msg":"Provided pb descriptor","service_files_cnt":1,"services":["gendocu.example.library_app.BookService"],"service_files":["service.proto"],"total_files":15}
{"level":"debug","ts":1656445785.5376472,"caller":"apiinfo/file.go:46","msg":"Received description for environments","environments":["private"]}
{"level":"debug","ts":1656445785.5379672,"caller":"grpc/main.go:26","msg":"Building server","port":442}
{"level":"debug","ts":1656445785.538227,"caller":"grpc/main.go:52","msg":"Starting gRPC Server with SSL","port":442,"cert_path":"/app/cert.pem","cert_key":"/app/privkey.pem"}
{"level":"debug","ts":1656445789.0697753,"caller":"grpc/main.go:40","msg":"Got gRPC Request","uri":"/gendocu.rpc_invoker.v1.RpcInvoker/InvokeMethod"}
{"level":"info","ts":1656445789.071215,"caller":"apiinfo/file.go:63","msg":"API Information provider ignore the build id, as you provided API specification file","file_path":"/app/app_spec.yaml"}
{"level":"debug","ts":1656445789.0717459,"caller":"rpcinvoker/service.go:81","msg":"fetching the protoset"}
{"level":"debug","ts":1656445789.073511,"caller":"rpcinvoker/service.go:99","msg":"dialing grpc","url":"10.135.0.3:81"}
{"level":"debug","ts":1656445789.0785632,"caller":"rpcinvoker/service.go:109","msg":"connection with 10.135.0.3:81 established"}
{"level":"debug","ts":1656445789.079015,"caller":"rpcinvoker/service.go:117","msg":"creating new client"}
{"level":"debug","ts":1656445789.079306,"caller":"rpcinvoker/service.go:146","msg":"Sending gRPC request","url":"grpc://10.135.0.3:81","service_id":"gendocu.example.library_app.BookService","method_id":"ListBooks"}

```