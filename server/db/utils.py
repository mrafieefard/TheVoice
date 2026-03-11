from beanie.migrations.database import DBHandler
from beanie.migrations.runner import MigrationNode
from beanie.migrations.models import RunningMode,RunningDirections
from config import MONGODB_URI

from pathlib import Path
import logging

async def run_migrate():
    logging.debug("start migrations")
    DBHandler.set_db(MONGODB_URI, "the-voice")
    root = await MigrationNode.build(Path("db","migrations"))
    mode = RunningMode(
        direction=RunningDirections.FORWARD
    )
    await root.run(
        mode=mode,
        allow_index_dropping=True,
        use_transaction=False
    )
    logging.info("migrations completed")
