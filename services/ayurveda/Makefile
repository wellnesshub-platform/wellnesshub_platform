# -------- Module Makefile --------

VENV ?= .venv
PYTHON := $(VENV)/bin/python
PIP := $(VENV)/bin/pip

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

.PHONY: setup test run lint format precommit clean
