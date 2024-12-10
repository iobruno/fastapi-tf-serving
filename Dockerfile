# Builder stage
FROM python:3.11-slim AS builder

COPY --from=ghcr.io/astral-sh/uv:latest /uv /uvx /bin/

ENV UV_COMPILE_BYTECODE=1

RUN --mount=type=cache,target=/root/.cache/uv \
    --mount=type=bind,source=uv.lock,target=uv.lock \
    --mount=type=bind,source=pyproject.toml,target=pyproject.toml \
    --mount=type=bind,source=README.md,target=README.md \
    uv pip install -r pyproject.toml --system

ADD app     /fastapi/app
ADD models  /fastapi/models

# Runner stage
FROM python:3.11-slim AS runner

WORKDIR /fastapi/

COPY --from=builder /usr/local/lib/python3.11   /usr/local/lib/python3.11
COPY --from=builder /usr/local/bin/*            /usr/local/bin/
COPY --from=builder /fastapi/                   /fastapi/
ADD pyproject.toml uv.lock                      /fastapi/

ENTRYPOINT ["uvicorn", "--app-dir", "./app/", "main:app", "--host", "0.0.0.0", "--port", "8080"]

EXPOSE 8080