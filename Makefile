arch_flag := $(shell uname -m)

setup:
	@poetry install

debug:
	@uvicorn app.main:app --host 0.0.0.0 --port 9000 --reload

docker-image:
	@docker buildx build -t iobruno/fastapi-model-serve:latest-aarch64 . --platform linux/arm64
	@docker buildx build -t iobruno/fastapi-model-serve:latest-amd64 . --platform linux/amd64

docker-run:
ifeq (${arch_flag},arm64)
	@docker run -p 8000:8000/tcp -e PROTOCOL_BUFFERS_PYTHON_IMPLEMENTATION=python iobruno/fastapi-model-serve:latest-aarch64
endif
ifeq (${arch_flag},aarch64)
	@docker run -p 8000:8000/tcp -e PROTOCOL_BUFFERS_PYTHON_IMPLEMENTATION=python iobruno/fastapi-model-serve:latest-aarch64
endif
ifeq (${arch_flag},x86_64)
	@docker run -p 8000:8000/tcp -e PROTOCOL_BUFFERS_PYTHON_IMPLEMENTATION=python iobruno/fastapi-model-serve:latest-amd64
endif


.PHONY: setup debug docker-image docker-run
