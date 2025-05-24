import os

from fastapi import FastAPI
from fastapi.staticfiles import StaticFiles

from openapi_server.apis.default_api import router as DefaultApiRouter

app = FastAPI(
    title="Body Service API",
    description="API for delivering wellness content related to Body (e.g., Yoga videos, exercise routines).",
    version="1.0.0",
)

# Dynamically resolve the path to the videos directory
BASE_DIR = os.path.dirname(os.path.abspath(__file__))
VIDEO_DIR = os.path.abspath(os.path.join(BASE_DIR, "../videos"))
print(f"📂 VIDEO_DIR resolved to: {VIDEO_DIR}")

if not os.path.exists(VIDEO_DIR):
    raise RuntimeError(f"❌ VIDEO_DIR does not exist: {VIDEO_DIR}")

app.mount("/videos", StaticFiles(directory=VIDEO_DIR), name="videos")

app.include_router(DefaultApiRouter)
