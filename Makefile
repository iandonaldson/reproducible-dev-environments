SHELL := /bin/bash
VENV_BIN := /opt/venv/bin
PY := $(VENV_BIN)/python
PIP := $(VENV_BIN)/pip

bootstrap:
	$(PIP) install --upgrade pip wheel setuptools pip-tools
	pip-compile ./.devcontainerrequirements.in -o requirements.txt
	pip-compile ./.devcontainer/requirements-dev.in -o requirements-dev.txt
	$(PIP) install -r requirements.txt -r requirements-dev.txt
	pre-commit install

lock:
	pip-compile ./.devcontainer/requirements.in      -o requirements.txt
	pip-compile ./.devcontainer/requirements-dev.in  -o requirements-dev.txt

sync:
	pip-sync requirements.txt requirements-dev.txt

test:
	pytest

lint:
	ruff check .
	mypy --ignore-missing-imports .

run:
	$(PY) -m uvicorn src.your_project.app:app --host 0.0.0.0 --port 8000

update:
	$(PIP) list --outdated
