# coding: utf-8

from typing import List  # noqa: F401

from fastapi.testclient import TestClient
from openapi_server.models.error import Error  # noqa: F401
from openapi_server.models.video import Video  # noqa: F401
from openapi_server.models.video_upload_request import \
    VideoUploadRequest  # noqa: F401


def test_yoga_videos_get(client: TestClient):
    """Test case for yoga_videos_get

    Get available yoga videos
    """

    headers = {}
    # uncomment below to make a request
    # response = client.request(
    #    "GET",
    #    "/yoga/videos",
    #    headers=headers,
    # )

    # uncomment below to assert the status code of the HTTP response
    # assert response.status_code == 200


def test_yoga_videos_post(client: TestClient):
    """Test case for yoga_videos_post

    Upload a new yoga video
    """
    video_upload_request = {
        "duration": "20:00",
        "difficulty": "Beginner",
        "title": "Evening Relaxation Yoga",
        "url": "https://cdn.wellnesshub.ai/videos/evening-relaxation.mp4",
        "tags": ["tags", "tags"],
    }

    headers = {}
    # uncomment below to make a request
    # response = client.request(
    #    "POST",
    #    "/yoga/videos",
    #    headers=headers,
    #    json=video_upload_request,
    # )

    # uncomment below to assert the status code of the HTTP response
    # assert response.status_code == 200
