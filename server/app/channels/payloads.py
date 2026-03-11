from pydantic import BaseModel
from db.enums import ChannelType
class ChannelPayload(BaseModel):
    name: str
    description: str
    type: ChannelType
    category_id: str