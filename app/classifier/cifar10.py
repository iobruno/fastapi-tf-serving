from io import BytesIO
from pathlib import Path

import httpx as r
import numpy as np
from PIL import Image
from tensorflow.keras.models import load_model
from tensorflow.keras.utils import img_to_array

models_dir = Path(__file__).parent.parent.parent.joinpath("models")
model = load_model(models_dir.joinpath("cifar10_model_v2.h5"))

labels = [
    "airplane",
    "automobile",
    "bird",
    "cat",
    "deer",
    "dog",
    "frog",
    "horse",
    "ship",
    "truck",
]


def predict(image_url: str) -> dict:
    response = r.get(image_url)
    img = Image.open(BytesIO(response.content)).convert("RGB").resize((32, 32))
    img_arr_3d: np.array = img_to_array(img)
    img_arr_4d: np.array = img_arr_3d[None, ...]
    predictions: np.array = model.predict(img_arr_4d).flatten()
    return format(predictions)


def format(predictions: np.array) -> dict:
    return {
        labels[index]: round(float(prediction) * 100, 5)
        for index, prediction in enumerate(predictions)
    }
