from fastapi import FastAPI

from uvicorn import Config, Server
from app import router as app_router

app = FastAPI()

app.include_router(app_router, prefix="/api")

async def run_api_server():
    config = Config(app=app, host="0.0.0.0", port=8000, log_level="info")
    server = Server(config)
    await server.serve()
    