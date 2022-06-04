from fastapi import APIRouter
from app.loaders.cifar10_classifier import predict, fmt_predictions

router = APIRouter()


@router.get("/predict")
async def classify_image(url: str):
    predictions = predict(url).flatten()
    return fmt_predictions(predictions)
