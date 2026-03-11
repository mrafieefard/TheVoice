from pydantic import BaseModel
from typing import Optional

class InformationModel(BaseModel):
    id : str
    name : str
    version : str
    server_icon : Optional[str] = None
    description : str