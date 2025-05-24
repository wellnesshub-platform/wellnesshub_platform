#!/bin/bash
echo "🔄 Cleaning and reorganizing..."

# Create directories
mkdir -p api scripts docker config

# Move OpenAPI spec
[ -f openapi.yaml ] && mv openapi.yaml api/body-api.yaml

# Move shell scripts
[ -f cleanup.sh ] && mv cleanup.sh scripts/
[ -f creatdirfile.sh ] && mv creatdirfile.sh scripts/

# Move Docker configs
[ -f Dockerfile ] && mv Dockerfile docker/
[ -f docker-compose.yml ] && mv docker-compose.yml docker/

# Move config files
[ -f .env ] && mv .env config/
[ -f .flake8 ] && mv .flake8 config/
[ -f pytest.ini ] && mv pytest.ini config/
[ -f pre-commit.yaml.bak ] && mv pre-commit.yaml config/pre-commit.yaml

echo "✅ Cleanup complete. Updated structure:"
tree -L 2
