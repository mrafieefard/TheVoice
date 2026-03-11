from beanie import Document, Indexed, Link
from typing import Optional
from datetime import datetime
from pydantic import Field
from typing import Optional
from .enums import ChannelType


class ServerConfig(Document):
    key: str = Indexed(unique=True)
    value: str
    
    @classmethod
    async def get_value(cls, key: str) -> Optional[str]:
        config = await cls.find_one(cls.key == key)
        return config.value if config else None
    
    @classmethod
    async def set_value(cls, key: str, value: str):
        config = await cls.find_one(cls.key == key)
        if config:
            config.value = value
            await config.save()
        else:
            await cls(key=key, value=value).insert()
    
    @classmethod
    async def delete_value(cls, key: str):
        config = await cls.find_one(cls.key == key)
        if config:
            await config.delete()
    
    @classmethod
    async def add_config(cls, key: str, value: str):
        existing_config = await cls.find_one(cls.key == key)
        if existing_config:
            raise ValueError(f"Config with key '{key}' already exists.")
        await cls(key=key, value=value).insert()
    

class Category(Document):
    name: str
    created_at: datetime = Field(default_factory=datetime.utcnow)

class Channel(Document):
    name: str
    description: Optional[str] = None
    type: ChannelType
    category: Optional[Link[Category]] = None
    created_at: datetime = Field(default_factory=datetime.utcnow)