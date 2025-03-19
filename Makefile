.PHONY: proto
proto:
	protoc --proto_path=./proto \
		--dart_out=grpc:lib/generated/grpc_pb \
		./proto/*.proto \
		./proto/common/*.proto