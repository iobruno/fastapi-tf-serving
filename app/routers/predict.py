from classifier.cifar10 import predict
from fastapi import APIRouter

router = APIRouter()


@router.get("/cifar10/predict")
async def classify_image(url: str) -> dict:
    return predict(url)
