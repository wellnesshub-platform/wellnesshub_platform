### File: openapi_server/routers/body_api.py

from fastapi import APIRouter, HTTPException, Body
from openapi_server.apis.body_api_base import BaseBodyApi
from openapi_server.models.video import Video
from openapi_server.models.video_upload_request import VideoUploadRequest
from openapi_server.models.error import Error
from typing import List

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
    video_upload_request: VideoUploadRequest = Body(..., description="Body video upload payload"),
) -> Video:
    if not BaseBodyApi.subclasses:
        raise HTTPException(status_code=500, detail="Not implemented")
    return await BaseBodyApi.subclasses[0]().body_videos_post(video_upload_request)


### File: openapi_server/apis/body_api_base.py

from typing import List, ClassVar, Tuple
from openapi_server.models.video import Video
from openapi_server.models.video_upload_request import VideoUploadRequest

class BaseBodyApi:
    subclasses: ClassVar[Tuple] = ()

    def __init_subclass__(cls, **kwargs):
        super().__init_subclass__(**kwargs)
        BaseBodyApi.subclasses = BaseBodyApi.subclasses + (cls,)

    async def body_videos_get(self) -> List[Video]:
        ...

    async def body_videos_post(self, video_upload_request: VideoUploadRequest) -> Video:
        ...


### File: openapi_server/models/video.py

from pydantic import BaseModel

class Video(BaseModel):
    id: str
    title: str
    description: str
    url: str


### File: openapi_server/models/video_upload_request.py

from pydantic import BaseModel

class VideoUploadRequest(BaseModel):
    title: str
    description: str
    filename: str


### File: openapi_server/models/error.py

from pydantic import BaseModel

class Error(BaseModel):
    code: int
    message: str


### File: openapi_server/main.py

from fastapi import FastAPI
import os
from fastapi.staticfiles import StaticFiles
from openapi_server.routers.body_api import router as BodyApiRouter

app = FastAPI()

BASE_DIR = os.path.dirname(os.path.abspath(__file__))
VIDEOS_DIR = os.path.abspath(os.path.join(BASE_DIR, "../../videos"))
app.mount("/videos", StaticFiles(directory=VIDEOS_DIR), name="videos")

app.include_router(BodyApiRouter)
