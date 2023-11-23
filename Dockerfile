# Builder stage
FROM python:3.11.6-slim AS builder

## COPY project files
ADD app /fastapi/app
ADD models /fastapi/models
ADD pyproject.toml pdm.lock README.md /fastapi/

WORKDIR /fastapi

## Install dependencies
RUN pip install -U pip setuptools wheel && \
    pip install pdm && \
    mkdir __pypackages__ && \
    pdm sync --prod --no-editable

# Runner stage
FROM python:3.11.6-slim AS runner

ENV PYTHONPATH=/fastapi/pkgs
COPY --from=builder /fastapi/__pypackages__/3.11/lib /fastapi/pkgs
COPY --from=builder /fastapi/__pypackages__/3.11/bin/* /bin/
COPY --from=builder /fastapi/app /fastapi/app
COPY --from=builder /fastapi/models /fastapi/models

ENTRYPOINT ["uvicorn", "--app-dir", "fastapi/app/", "main:app", "--host", "0.0.0.0", "--port", "8000", "--reload"]

EXPOSE 8000