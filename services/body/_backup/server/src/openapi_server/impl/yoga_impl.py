from typing import List

from openapi_server.apis.default_api_base import BaseDefaultApi
from openapi_server.models.video import Video
from openapi_server.models.video_upload_request import VideoUploadRequest


class YogaVideoApiImpl(BaseDefaultApi):
    async def yoga_videos_get(self) -> List[Video]:
        # Replace with real logic, e.g., fetch from DB
        return [
            Video(
                id="vid1",
                title="Surya Namaskar",
                url="http://localhost:8000/videos/surya-namaskar.mp4",
            ),
            Video(
                id="vid2",
                title="Vrikshasana",
                url="http://localhost:8000/videos/vrikshasana.mp4",
            ),
        ]

    async def yoga_videos_post(self, video_upload_request: VideoUploadRequest) -> Video:
        # Replace with logic to store metadata and return confirmation
        return Video(
            id="vid3",
            title=video_upload_request.title,
            url=f"http://example.com/uploads/{video_upload_request.title.replace(' ', '_').lower()}.mp4",
        )
