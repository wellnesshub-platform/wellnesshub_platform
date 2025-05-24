from pydantic import BaseModel


class Video(BaseModel):
    id: str
    title: str
    description: str
    url: str
