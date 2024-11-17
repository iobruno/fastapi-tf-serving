from classifier.cifar10 import predict
from fastapi import APIRouter

router = APIRouter()


@router.get("/predict/cifar10")
async def classify_image(url: str):
    return predict(url)
