FROM python:3.12-slim-bookworm

COPY --from=ghcr.io/astral-sh/uv:0.6.12 /uv /bin/uv

WORKDIR /app

ADD . /app

RUN uv sync --frozen

CMD ["uv", "run", "python", "main.py"]
