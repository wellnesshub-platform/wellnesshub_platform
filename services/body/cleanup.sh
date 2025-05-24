#!/bin/bash

echo "🔄 Starting cleanup for BODY service..."

# Move important meta files to body root
mv server/src/requirements.txt . 2>/dev/null
mv server/src/Makefile . 2>/dev/null
mv server/src/.gitignore . 2>/dev/null
mv server/src/.pre-commit-config.yaml . 2>/dev/null

# Remove old generated dirs
rm -rf server/__pycache__
rm -rf server/src/__pycache__
rm -rf server/test
rm -rf server/docs
rm -rf server/.openapi-generator
rm -rf server/src/openapi_server/apis
rm -rf server/src/openapi_server/models
rm -rf server/src/openapi_server/test
rm -rf server/src/openapi_server/routers

# Keep your main app and implementation
mkdir -p src/openapi_server
mv server/src/openapi_server/* src/openapi_server/ 2>/dev/null

# Fix venv
if [ ! -d ".venv" ]; then
  echo "⚙️  Creating fresh virtual environment..."
  python3 -m venv .venv
  source .venv/bin/activate
  pip install --upgrade pip
  pip install -r requirements.txt
fi

echo "✅ Cleanup complete. You may now regenerate API code if needed."
