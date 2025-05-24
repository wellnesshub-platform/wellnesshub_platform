# coding: utf-8

from typing import ClassVar, Dict, List, Tuple  # noqa: F401

from openapi_server.models.error import Error
from openapi_server.models.video import Video
from openapi_server.models.video_upload_request import VideoUploadRequest


class BaseDefaultApi:
    subclasses: ClassVar[Tuple] = ()

    def __init_subclass__(cls, **kwargs):
        super().__init_subclass__(**kwargs)
        BaseDefaultApi.subclasses = BaseDefaultApi.subclasses + (cls,)

    async def yoga_videos_get(
        self,
    ) -> List[Video]:
        """Returns a list of available yoga videos with metadata."""
        ...

    async def yoga_videos_post(
        self,
        video_upload_request: VideoUploadRequest,
    ) -> Video:
        """Adds a new yoga video entry with metadata."""
        ...
