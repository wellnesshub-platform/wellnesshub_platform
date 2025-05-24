# -------- Body Service Makefile --------

VENV ?= .venv
PYTHON := $(VENV)/bin/python
PIP := $(VENV)/bin/pip

OPENAPI_FILE = api/body-api.yaml
OUTPUT_DIR = server

.PHONY: setup test run lint format precommit clean generate clean-server

# Create venv and install dependencies
setup:
	python3 -m venv $(VENV)
	$(PIP) install --upgrade pip
	$(PIP) install -r requirements.txt
	$(PIP) install -r requirements-dev.txt
	@echo "✅ Environment setup complete."

# Run tests
test:
	$(PYTHON) -m pytest tests

# Run main app
run:
	$(PYTHON) main.py

# Lint code
lint:
	$(VENV)/bin/flake8 .
	$(VENV)/bin/black . --check
	$(VENV)/bin/isort . --check

# Auto-fix lint
format:
	$(VENV)/bin/black .
	$(VENV)/bin/isort .

# Pre-commit checks
precommit:
	pre-commit run --all-files

# Clean artifacts
clean:
	find . -type d -name "__pycache__" -exec rm -r {} +
	find . -type f -name "*.pyc" -delete

# Generate FastAPI server code from OpenAPI spec
generate:
	@echo "🔧 Generating FastAPI server from OpenAPI spec..."
	openapi-generator generate \
		-i $(OPENAPI_FILE) \
		-g python-fastapi \
		-o $(OUTPUT_DIR)

# Clean generated FastAPI server
clean-server:
	@echo "🧹 Cleaning generated FastAPI server code..."
	rm -rf $(OUTPUT_DIR)