from db import initDb
from api_server import run_api_server
from voice_server import run_voice_server
import asyncio

async def run_server():
    await initDb()
    await asyncio.gather(run_api_server(),run_voice_server(
        host="0.0.0.0", port=8888
    ))
    
    
if __name__ == "__main__":    
    asyncio.run(run_server())