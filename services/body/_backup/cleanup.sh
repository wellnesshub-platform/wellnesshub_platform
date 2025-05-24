#!/bin/bash

echo "🔄 Starting cleanup in $(pwd)..."

# Backup safety
mkdir -p _backup
cp -r ./* _backup/

# Create desired folders
mkdir -p config
mkdir -p server/static

# Move config files
mv docker-compose.yaml Dockerfile pyproject.toml openapi.yaml setup.cfg config/ 2>/dev/null

# Move OpenAPI and FastAPI code into server
mv api server/ 2>/dev/null
mv src server/ 2>/dev/null

# Delete redundant or generated directories
rm -rf .data .config .openapi-generator .vscode doc bin impl tools website

# Move any root-level test files into tests/
mkdir -p tests
find . -maxdepth 1 -name "test_*.py" -exec mv {} tests/ \;

# Ensure venv is in right place
if [ ! -d ".venv" ]; then
  python3 -m venv .venv
  echo "✅ Created new virtual environment."
fi

echo "✅ Cleanup complete. Final structure is ready."
