ARG BUILD_ENV=dev

FROM python:3.11-slim-buster as build

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        build-essential apt-utils libbz2-dev curl \
    && rm -rf /var/lib/apt/lists/*

RUN curl -sSL https://install.python-poetry.org | python3 -
ENV PATH="/root/.local/bin:$PATH"

WORKDIR /app

COPY poetry.lock pyproject.toml ./
RUN poetry config virtualenvs.create false
RUN poetry install
COPY . .
