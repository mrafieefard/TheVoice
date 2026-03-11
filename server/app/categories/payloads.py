from pydantic import BaseModel

class CategoryPayload(BaseModel):
    name: str