import os

from fastapi import FastAPI
from fastapi.staticfiles import StaticFiles

from openapi_server.routers.body_api import router as BodyApiRouter

app = FastAPI(
    title="Body Service API",
    description="API for delivering wellness content related to Body (e.g., Yoga videos, exercise routines).",
    version="1.0.0",
)

BASE_DIR = os.path.dirname(os.path.abspath(__file__))
VIDEO_DIR = os.path.join(BASE_DIR, "videos")
app.mount("/videos", StaticFiles(directory=VIDEO_DIR), name="videos")

app.include_router(BodyApiRouter)
