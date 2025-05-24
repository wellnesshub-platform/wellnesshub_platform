import os

from fastapi import FastAPI
from fastapi.staticfiles import StaticFiles

from openapi_server.routers.default_api import router as DefaultApiRouter


def main():
    print("🚀 Starting BODY WellnessHub module...")


if __name__ == "__main__":
    main()


app = FastAPI()

# Serve static video files
BASE_DIR = os.path.dirname(os.path.abspath(__file__))
app.mount(
    "/videos",
    StaticFiles(directory=os.path.join(BASE_DIR, "../../videos")),
    name="videos",
)
