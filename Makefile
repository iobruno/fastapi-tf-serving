.PHONY: setup debug docker-image docker-image-arm64 docker-image-amd64 docker-run

arch_flag := $(shell uname -m)

setup:
	@pdm install

debug:
	@uvicorn --app-dir app/ main:app --host 0.0.0.0 --port 8000 --reload

docker-image: docker-image-arm64 docker-image-amd64 

docker-image-arm64:
	@docker buildx build -t iobruno/fastapi-tf-serve.aarch64 . --platform linux/arm64 --no-cache

docker-image-amd64:
	@docker buildx build -t iobruno/fastapi-tf-serve.amd64 . --platform linux/amd64 --no-cache

docker-run:
ifeq (${arch_flag},arm64)
	@docker run -p 8000:8000 -e PROTOCOL_BUFFERS_PYTHON_IMPLEMENTATION=python iobruno/fastapi-tf-serve.aarch64
endif
ifeq (${arch_flag},aarch64)
	@docker run -p 8000:8000 -e PROTOCOL_BUFFERS_PYTHON_IMPLEMENTATION=python iobruno/fastapi-tf-serve.aarch64
endif
ifeq (${arch_flag},x86_64)
	@docker run -p 8000:8000 -e PROTOCOL_BUFFERS_PYTHON_IMPLEMENTATION=python iobruno/fastapi-tf-serve.amd64
endif
