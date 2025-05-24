import os
import shutil

base = "."

# Ensure target directories exist
os.makedirs(f"{base}/api", exist_ok=True)
os.makedirs(f"{base}/src/openapi_server/apis", exist_ok=True)
os.makedirs(f"{base}/src/openapi_server/models", exist_ok=True)
os.makedirs(f"{base}/src/openapi_server/routers", exist_ok=True)
os.makedirs(f"{base}/videos", exist_ok=True)

# Files to move and their targets
moves = {
    f"{base}/body_api_base.py": f"{base}/src/openapi_server/apis/body_api_base.py",
    f"{base}/main.py": f"{base}/src/openapi_server/main.py",
    f"{base}/security_api.py": f"{base}/src/openapi_server/security_api.py",
    f"{base}/video.py": f"{base}/src/openapi_server/models/video.py",
    f"{base}/video_upload_request.py": f"{base}/src/openapi_server/models/video_upload_request.py",
    f"{base}/error.py": f"{base}/src/openapi_server/models/error.py",
    f"{base}/body_api.py": f"{base}/src/openapi_server/routers/body_api.py",
    f"{base}/body_impl.py": f"{base}/src/openapi_server/routers/body_impl.py",
    f"{base}/body-api.yaml": f"{base}/api/body-api.yaml",
}

# Move the files
for src, dst in moves.items():
    if os.path.exists(src):
        os.makedirs(os.path.dirname(dst), exist_ok=True)
        print(f"Moving {src} -> {dst}")
        shutil.move(src, dst)

# Optional: remove placeholder files/dirs if no longer needed
trash = [
    f"{base}/0",  # accidental numeric folder
    f"{base}/__init__.py",  # duplicate root-level init
    f"{base}/openapi_server",  # wrong-level openapi_server dir
]

for path in trash:
    if os.path.exists(path):
        print(f"Removing {path}")
        shutil.rmtree(path, ignore_errors=True)

print("✅ Cleanup complete.")
