# placeholder content
from typing import List

from fastapi import APIRouter, Body, HTTPException

from openapi_server.apis.body_api_base import BaseBodyApi
from openapi_server.models.error import Error
from openapi_server.models.video import Video
from openapi_server.models.video_upload_request import VideoUploadRequest

router = APIRouter()


@router.get(
    "/body/videos",
    responses={
        200: {"model": List[Video], "description": "List of body videos"},
        500: {"model": Error, "description": "Server error"},
    },
    tags=["body"],
    summary="Get available body videos",
)
async def body_videos_get() -> List[Video]:
    print("📥 API Request: Fetching body videos")
    if not BaseBodyApi.subclasses:
        raise HTTPException(status_code=500, detail="Not implemented")
    return await BaseBodyApi.subclasses[0]().body_videos_get()


@router.post(
    "/body/videos",
    responses={
        201: {"model": Video, "description": "Video uploaded successfully"},
        400: {"model": Error, "description": "Invalid input"},
        500: {"model": Error, "description": "Server error"},
    },
    tags=["body"],
    summary="Upload a new body video",
)
async def body_videos_post(
    video_upload_request: VideoUploadRequest = Body(
        ..., description="Body video upload payload"
    ),
) -> Video:
    print(f"📤 API Request: Uploading video with title '{video_upload_request.title}'")
    if not BaseBodyApi.subclasses:
        raise HTTPException(status_code=500, detail="Not implemented")
    return await BaseBodyApi.subclasses[0]().body_videos_post(video_upload_request)


# openapi_server/routers/body_impl.py

from openapi_server.apis.body_api_base import BaseBodyApi
from openapi_server.models.video import Video
from openapi_server.models.video_upload_request import VideoUploadRequest


class BodyApiImpl(BaseBodyApi):
    async def body_videos_get(self):
        print("📡 Impl: Returning sample body videos")
        return [
            Video(
                id="1",
                title="Surya Namaskar",
                description="Morning yoga routine",
                url="http://localhost:8000/videos/surya-namaskar.mp4",
            ),
            Video(
                id="2",
                title="Bhujangasana",
                description="Cobra pose demo",
                url="http://localhost:8000/videos/bhujangasana_video.mp4",
            ),
        ]

    async def body_videos_post(self, video_upload_request: VideoUploadRequest):
        print(
            f"✅ Impl: Stored video '{video_upload_request.title}' with filename '{video_upload_request.filename}'"
        )
        return Video(
            id="new",
            title=video_upload_request.title,
            description=video_upload_request.description,
            url=f"http://localhost:8000/videos/{video_upload_request.filename}",
        )
