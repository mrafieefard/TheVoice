from beanie import init_beanie
from db.utils import run_migrate
from pymongo import AsyncMongoClient

from config import MONGODB_URI

from .models import *


async def initDb():
    await run_migrate()
    client = AsyncMongoClient(MONGODB_URI)
    await init_beanie(database=client.thevoice, document_models=[
        ServerConfig,
        Category,
        Channel,
    ])
