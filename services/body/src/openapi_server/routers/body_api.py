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
    video_upload_request: VideoUploadRequest = Body(...),
) -> Video:
    if not BaseBodyApi.subclasses:
        raise HTTPException(status_code=500, detail="Not implemented")
    return await BaseBodyApi.subclasses[0]().body_videos_post(video_upload_request)
