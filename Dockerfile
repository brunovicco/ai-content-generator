# Multi-stage build (Factor II - Dependencies) with Datadog
FROM python:3.11-slim AS base

# Install system dependencies
RUN apt-get update && apt-get install -y \
    gcc \
    curl \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Copy and install Python dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Runtime stage
FROM python:3.11-slim AS runtime

WORKDIR /app

# Install curl for health checks
RUN apt-get update && apt-get install -y \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Copy installed Python dependencies
COPY --from=base /usr/local/lib/python3.11/site-packages /usr/local/lib/python3.11/site-packages
COPY --from=base /usr/local/bin /usr/local/bin

# Copy application code
COPY . .

# Create non-root user for security
RUN useradd -m -u 1001 appuser && chown -R appuser:appuser /app
USER appuser

# Set Datadog environment variables
ENV DD_SERVICE=ai-content-generator
ENV DD_ENV=production
ENV DD_VERSION=1.0.0
ENV DD_LOGS_INJECTION=true
ENV DD_TRACE_ENABLED=true
ENV DD_PROFILING_ENABLED=true
ENV DD_RUNTIME_METRICS_ENABLED=true

# Port binding (Factor VII)
EXPOSE 8000

# Health check
HEALTHCHECK --interval=30s --timeout=10s --start-period=5s --retries=3 \
    CMD curl -f http://localhost:8000/api/v1/health/live || exit 1

# Start app with Datadog tracing enabled
CMD ["ddtrace-run", "uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]
