from fastapi import APIRouter


router = APIRouter()


@router.get("/predict")
async def predict(img_url: str):
    return [
        {"username": "Rick"},
        {"username": "Morty"}
    ]
