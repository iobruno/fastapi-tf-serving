# Builder stage
FROM python:3.12-slim AS builder

ADD app /fastapi/app
ADD models /fastapi/models
ADD pyproject.toml pdm.lock README.md /fastapi/

WORKDIR /fastapi

RUN apt-get update --allow-insecure-repositories && \
    apt-get install pkg-config libhdf5-dev gcc -y && \
    pip install -U pip setuptools wheel && \
    pip install pdm && \
    mkdir __pypackages__ && \
    pdm sync --prod --no-editable

# Runner stage
FROM python:3.12-slim AS runner

RUN apt-get update --allow-insecure-repositories && \
    apt-get install libhdf5-dev -y

ENV PYTHONPATH=/usr/local/lib/python/
COPY --from=builder /fastapi/__pypackages__/3.12/lib /usr/local/lib/python/
COPY --from=builder /fastapi/__pypackages__/3.12/bin/* /usr/local/bin/
COPY --from=builder /fastapi/app /fastapi/app
COPY --from=builder /fastapi/models /fastapi/models

WORKDIR /fastapi/

ENTRYPOINT ["uvicorn", "--app-dir", "./app/", "main:app", "--host", "0.0.0.0", "--port", "8000", "--reload"]

EXPOSE 8000