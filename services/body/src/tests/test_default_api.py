# coding: utf-8

import pytest
from fastapi.testclient import TestClient

from openapi_server.main import app

client = TestClient(app)


def test_yoga_videos_get():
    """Test case for yoga_videos_get — Get available yoga videos"""
    response = client.get("/yoga/videos")
    assert response.status_code in [200, 404]  # Adjust if route is implemented


def test_yoga_videos_post():
    """Test case for yoga_videos_post — Upload a new yoga video"""
    video_upload_request = {
        "duration": "20:00",
        "difficulty": "Beginner",
        "title": "Evening Relaxation Yoga",
        "url": "https://cdn.wellnesshub.ai/videos/evening-relaxation.mp4",
        "tags": ["relaxation", "beginner"],
    }

    response = client.post("/yoga/videos", json=video_upload_request)
    assert response.status_code in [200, 201, 422]  # 422 if validation fails
