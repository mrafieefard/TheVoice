from pydantic import BaseModel
from typing import TYPE_CHECKING
if TYPE_CHECKING:
    from db.models import Category as CategoryDB

class CategoryModel(BaseModel):
    id : str
    name: str
    
    @classmethod
    async def from_db(cls, category_db : "CategoryDB"):
        return cls(
            id=str(category_db.id),
            name=category_db.name
        )