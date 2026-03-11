from fastapi import APIRouter
from .models import ChannelModel
from .payloads import ChannelPayload
from db.models import Channel, Category
from db.enums import ChannelType
from typing import List

router = APIRouter()


@router.get("/", response_model=List[ChannelModel])
async def get_channels():
    channels = await Channel.find_all().to_list()
    return [await ChannelModel.from_db(channel) for channel in channels]


@router.post("/", response_model=ChannelModel)
async def create_channel(payload: ChannelPayload):
    category_db = await Category.get(payload.category_id) if payload.category_id else None
    channel_db = Channel(
        name=payload.name,
        description=payload.description,
        type=payload.type,
        category=category_db,
    )
    await channel_db.insert()
    return await ChannelModel.from_db(channel_db,fetch=False)
