VENV := .venv
PYTHON := $(VENV)/bin/python
PIP := $(VENV)/bin/pip
OPENAPI_FILE := api/body-api.yaml
OUTPUT_DIR := src
TEMPLATE_DIR := templates/python-fastapi

setup:
	python3 -m venv $(VENV)
	$(PIP) install --upgrade pip
	$(PIP) install -r requirements.txt

generate:
	openapi-generator generate \
		-i $(OPENAPI_FILE) \
		-g python-fastapi \
		-o $(OUTPUT_DIR) \
		--template-dir $(TEMPLATE_DIR)

run:
	PYTHONPATH=src $(VENV)/bin/uvicorn openapi_server.main:app --reload

clean:
	rm -rf $(OUTPUT_DIR)/openapi_server