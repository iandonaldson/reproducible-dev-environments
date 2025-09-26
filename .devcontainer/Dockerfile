FROM python:3.12-slim

# System libs commonly needed by DS/LLM projects
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential git curl ca-certificates \
    libssl-dev libffi-dev pkg-config \
    && rm -rf /var/lib/apt/lists/*

# (Optional) git-lfs for models/datasets
# RUN curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | bash && \
#     apt-get update && apt-get install -y git-lfs && git lfs install && \
#     rm -rf /var/lib/apt/lists/*

WORKDIR /workspace

# Create an isolated venv inside the container
RUN python -m venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH" \
    PIP_DISABLE_PIP_VERSION_CHECK=1 \
    PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1


# Compile lock files and install will be run by Makefile (make bootstrap)
# as part of the postCreateCommand


# Copy minimal requirement sources first for better Docker layer caching
# COPY requirements.in requirements-dev.in ./

# Upgrade tooling and install pip-tools (for deterministic lock files)
# RUN pip install --upgrade pip wheel setuptools && pip install pip-tools



# Compile lock files and install (will be re-run by Makefile as needed)
# RUN pip-compile requirements.in -o requirements.txt && \
#    pip-compile requirements-dev.in -o requirements-dev.txt && \
#    pip install -r requirements.txt -r requirements-dev.txt

# Copy the rest of the project
# In devcontainers the repo is bind-mounted at runtime, so you usually don't need this:
# COPY . .
