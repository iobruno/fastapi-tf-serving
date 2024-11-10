# Builder stage
FROM python:3.11-slim AS builder

ADD app /fastapi/app
ADD models /fastapi/models
ADD pyproject.toml pdm.lock README.md /fastapi/

WORKDIR /fastapi

RUN pip install -U pip setuptools wheel && \
    pip install pdm && \
    mkdir -p __pypackages__ && \
    pdm sync --prod --no-self --no-editable

# Runner stage
FROM python:3.11-slim AS runner

ENV PYTHONPATH=/usr/local/lib/python/
COPY --from=builder /fastapi/__pypackages__/3.11/lib /usr/local/lib/python/
COPY --from=builder /fastapi/__pypackages__/3.11/bin/* /usr/local/bin/
COPY --from=builder /fastapi/app /fastapi/app
COPY --from=builder /fastapi/models /fastapi/models

WORKDIR /fastapi/

ENTRYPOINT ["uvicorn", "--app-dir", "./app/", "main:app", "--host", "0.0.0.0", "--port", "8000", "--reload"]

EXPOSE 8000