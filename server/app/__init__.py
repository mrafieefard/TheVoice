from fastapi import APIRouter
import os
from base64 import b64encode
import uuid

from .models import InformationModel
from .categories import router as categories_router
from .channels import router as channels_router

router = APIRouter()
router.include_router(categories_router, prefix="/categories",tags=["Categories"])
router.include_router(channels_router, prefix="/channels",tags=["Channels"])


@router.get("/health")
async def health_check():
    """Health check endpoint"""
    return {"status": "ok"}


@router.get("/information", response_model=InformationModel)
async def get_information():
    server_icon_data = None
    if os.path.exists(os.path.join(os.getcwd(), "icon.png")):
        with open(os.path.join(os.getcwd(), "icon.png"), "rb") as server_icon:
            server_icon_data = server_icon.read()

    return InformationModel(
        id="37f661c1-8e16-45d1-8fdb-fcbfa2ce372e",
        name="Voice",
        version="1.0.0",
        server_icon=(
            b64encode(server_icon_data).decode("utf-8") if server_icon_data else None
        ),
        description="A real-time voice communication server built with FastAPI and Beanie.",
    )
