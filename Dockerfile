# Builder stage
FROM python:3.11-slim AS builder
COPY --from=ghcr.io/astral-sh/uv:latest /uv /uvx /bin/

WORKDIR /fastapi

RUN --mount=type=cache,target=/root/.cache/uv \
    --mount=type=bind,source=uv.lock,target=uv.lock \
    --mount=type=bind,source=pyproject.toml,target=pyproject.toml \
    uv sync --frozen --no-dev

ADD app /fastapi/app
ADD models /fastapi/models

# Runner stage
FROM python:3.11-slim AS runner

COPY --from=builder --chown=app:app /fastapi/.venv /fastapi/.venv
COPY --from=builder /fastapi/app /fastapi/app
COPY --from=builder /fastapi/models /fastapi/models

WORKDIR /fastapi/

ENTRYPOINT ["/fastapi/.venv/bin/uvicorn", "--app-dir", "./app/", "main:app", "--host", "0.0.0.0", "--port", "8080", "--reload"]

EXPOSE 8080