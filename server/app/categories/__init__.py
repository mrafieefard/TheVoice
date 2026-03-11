from fastapi import APIRouter
from typing import List
from .payloads import CategoryPayload
from .models import CategoryModel
from db.models import Category

router = APIRouter()

@router.get("/",response_model=List[CategoryModel])
async def get_categories():
    categories = await Category.find_all().to_list()
    return [await CategoryModel.from_db(category) for category in categories]

@router.post("/",response_model=CategoryModel)
async def create_category(payload : CategoryPayload):
    category = Category(name=payload.name)
    await category.insert()
    
    return await CategoryModel.from_db(category)