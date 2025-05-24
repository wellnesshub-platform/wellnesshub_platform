# coding: utf-8

import importlib
import pkgutil
from typing import Dict, List  # noqa: F401

from fastapi import (  # noqa: F401
    APIRouter,
    Body,
    Cookie,
    Depends,
    Form,
    Header,
    HTTPException,
    Path,
    Query,
    Response,
    Security,
    status,
)

import openapi_server.impl
from openapi_server.apis.default_api_base import BaseDefaultApi
from openapi_server.models.error import Error
from openapi_server.models.extra_models import TokenModel  # noqa: F401
from openapi_server.models.video import Video
from openapi_server.models.video_upload_request import VideoUploadRequest

router = APIRouter()

ns_pkg = openapi_server.impl
for _, name, _ in pkgutil.iter_modules(ns_pkg.__path__, ns_pkg.__name__ + "."):
    importlib.import_module(name)


@router.get(
    "/yoga/videos",
    responses={
        200: {"model": List[Video], "description": "List of yoga videos"},
        500: {"model": Error, "description": "Server error"},
    },
    tags=["default"],
    summary="Get available yoga videos",
    response_model_by_alias=True,
)
async def yoga_videos_get() -> List[Video]:
    """Returns a list of available yoga videos with metadata."""
    if not BaseDefaultApi.subclasses:
        raise HTTPException(status_code=500, detail="Not implemented")
    return await BaseDefaultApi.subclasses[0]().yoga_videos_get()


@router.post(
    "/yoga/videos",
    responses={
        201: {"model": Video, "description": "Video uploaded successfully"},
        400: {"model": Error, "description": "Invalid input"},
        500: {"model": Error, "description": "Server error"},
    },
    tags=["default"],
    summary="Upload a new yoga video",
    response_model_by_alias=True,
)
async def yoga_videos_post(
    video_upload_request: VideoUploadRequest = Body(None, description=""),
) -> Video:
    """Adds a new yoga video entry with metadata."""
    if not BaseDefaultApi.subclasses:
        raise HTTPException(status_code=500, detail="Not implemented")
    return await BaseDefaultApi.subclasses[0]().yoga_videos_post(video_upload_request)
