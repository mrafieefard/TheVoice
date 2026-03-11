from decouple import config
from dotenv import load_dotenv
from pathlib import Path
import os

load_dotenv()

MONGODB_URI = config("MONGODB_URI")