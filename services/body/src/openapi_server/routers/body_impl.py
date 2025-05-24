# placeholder content
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
