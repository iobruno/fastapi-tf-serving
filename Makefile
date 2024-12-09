.PHONY: run docker-image docker-run

arch_flag := $(shell uname -m)

IMG_NAME_ARM64 := iobruno/fastapi-tf-serve:aarch64
IMG_NAME_AMD64 := iobruno/fastapi-tf-serve:amd64

run:
	@uvicorn --app-dir app/ main:app --host 0.0.0.0 --port 8000 --reload

docker-image-arm64:
	@docker buildx build -t $(IMG_NAME_ARM64) . --platform linux/arm64

docker-image-amd64:
	@docker buildx build -t $(IMG_NAME_AMD64) . --platform linux/amd64

docker-run-arm64:
	@docker run --rm \
		-e PROTOCOL_BUFFERS_PYTHON_IMPLEMENTATION=python \
		-p 8080:8080 \
		--name fastapi-tf-serve \
		$(IMG_NAME_ARM64)

docker-run-amd64:
	@docker run --rm \
		-e PROTOCOL_BUFFERS_PYTHON_IMPLEMENTATION=python \
		-p 8080:8080 \
		--name fastapi-tf-serve \
		$(IMG_NAME_ARM64)

docker-image:
ifeq (${arch_flag},arm64)
	@$(MAKE) docker-image-arm64
endif
ifeq (${arch_flag},aarch64)
	@$(MAKE) docker-image-arm64
endif
ifeq (${arch_flag},x86_64)
	@$(MAKE) docker-image-amd64
endif

docker-run:
ifeq (${arch_flag},arm64)
	@$(MAKE) docker-run-arm64
endif
ifeq (${arch_flag},aarch64)
	@$(MAKE) docker-run-arm64
endif
ifeq (${arch_flag},x86_64)
	@$(MAKE) docker-run-amd64
endif