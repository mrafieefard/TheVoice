from pydantic import BaseModel
from datetime import datetime
from typing import Optional,TYPE_CHECKING
from db.enums import ChannelType

if TYPE_CHECKING:
    from db.models import Channel as ChannelDB

class ChannelModel(BaseModel):
    id: str
    name: str
    description: Optional[str] = None
    type: ChannelType
    category_id: Optional[str] = None
    created_at: datetime
    
    @classmethod
    async def from_db(cls,channel_db : "ChannelDB",fetch: bool = True):
        category = await channel_db.category.fetch() if fetch else channel_db.category
            
        return cls(
            id=str(channel_db.id),
            name=channel_db.name,
            description=channel_db.description,
            type=channel_db.type,
            category_id=str(category.id) if category else None,
            created_at=channel_db.created_at
        )