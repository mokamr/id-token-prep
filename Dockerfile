# syntax=docker/dockerfile:1

FROM cgr.dev/chainguard/python:latest-dev AS builder

WORKDIR /app

# Create virtual environment
RUN python -m venv /app/venv

ENV PATH="/app/venv/bin:$PATH"

# Install Python dependencies
RUN pip install --no-cache-dir \
    flask \
    requests


FROM cgr.dev/chainguard/python:latest

WORKDIR /app

# Copy virtual environment from builder
COPY --from=builder /app/venv /app/venv

ENV PATH="/app/venv/bin:$PATH"

CMD ["python"]