#!/bin/bash

BASE_DIR="/Users/himanshushukla/projects/wellnesshub_platform/services/body/src"

declare -A structure=(
  ["openapi_server"]="__init__.py main.py security_api.py"
  ["openapi_server/apis"]="__init__.py body_api_base.py"
  ["openapi_server/routers"]="__init__.py body_api.py body_impl.py"
  ["openapi_server/models"]="__init__.py video.py video_upload_request.py error.py"
)

for dir in "${!structure[@]}"; do
  full_dir="$BASE_DIR/$dir"
  mkdir -p "$full_dir"
  for file in ${structure[$dir]}; do
    full_file="$full_dir/$file"
    if [ ! -f "$full_file" ]; then
      touch "$full_file"
      echo "✅ Created file: $full_file"
      # Optional: Add boilerplate for models
      if [[ $file == "video.py" ]]; then
        echo -e "from pydantic import BaseModel\n\nclass Video(BaseModel):\n    id: str\n    title: str\n    description: str\n    url: str" > "$full_file"
      elif [[ $file == "video_upload_request.py" ]]; then
        echo -e "from pydantic import BaseModel\n\nclass VideoUploadRequest(BaseModel):\n    title: str\n    description: str\n    filename: str" > "$full_file"
      elif [[ $file == "error.py" ]]; then
        echo -e "from pydantic import BaseModel\n\nclass Error(BaseModel):\n    code: int\n    message: str" > "$full_file"
      fi
    fi
  done
done
