CURRENT_DIR := $(shell pwd)
GO_MODULE := gitlab.com/programmingiswonderful/saidoff-tt-contracts/gen/go

gen:
	buf generate && \
	cd ./gen/go && \
	go mod init $(GO_MODULE) && \
	go mod tidy

lint:
	buf lint

format:
	buf format

clean:
	@rm -rf ./gen || true

install:
	go install github.com/bufbuild/buf/cmd/buf@v1.47.2
	go install \
    		github.com/grpc-ecosystem/grpc-gateway/v2/protoc-gen-openapiv2@latest \
    		github.com/grpc-ecosystem/grpc-gateway/v2/protoc-gen-grpc-gateway@latest