.PHONY: setup run docker_build

setup:
	@poetry install --no-root

debug:
	@uvicorn app.main:app --host 0.0.0.0 --port 8000 --reload 

docker_build:
	@docker buildx build --platform linux/amd64 -t iobruno/fastapi-model-serve .
