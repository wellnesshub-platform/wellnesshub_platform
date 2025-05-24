# openapi_server/apis/body_api_base.py

from typing import ClassVar, List, Tuple

from openapi_server.models.video import Video
from openapi_server.models.video_upload_request import VideoUploadRequest


class BaseBodyApi:
    subclasses: ClassVar[Tuple] = ()

    def __init_subclass__(cls, **kwargs):
        super().__init_subclass__(**kwargs)
        BaseBodyApi.subclasses = BaseBodyApi.subclasses + (cls,)

    async def body_videos_get(self) -> List[Video]:
        """
        Retrieve a list of body-related videos (e.g., yoga, exercise routines).
        Should be implemented by subclass.
        """
        raise NotImplementedError("body_videos_get method not implemented")

    async def body_videos_post(self, video_upload_request: VideoUploadRequest) -> Video:
        """
        Upload a new body video, storing its metadata and returning the created video object.
        Should be implemented by subclass.
        """
        raise NotImplementedError("body_videos_post method not implemented")
