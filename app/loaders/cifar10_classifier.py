import httpx as r
from io import BytesIO
from PIL import Image
from keras.preprocessing.image import load_img
from keras.preprocessing.image import img_to_array
from keras.preprocessing.image import array_to_img
import keras.preprocessing.image

def predict(image_url: str):
    response = r.get(image_url)
    img = Image\
        .open(BytesIO(response.content))\
        .convert('RGB')\
        .resize((32, 32))
    img_array = keras.load



if __name__ == "__main__":
    url = "https://aeromagazine.uol.com.br/media/versions/e170_united_express_2_free_big.jpg"
    predict(url)
