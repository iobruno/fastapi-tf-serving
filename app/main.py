from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from starlette.responses import RedirectResponse
from app.routers import model_predict
import uvicorn

app = FastAPI()
app.include_router(model_predict.router)
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_methods=["*"],
    allow_headers=["*"],
    allow_credentials=True
)


@app.get("/")
async def root():
    return RedirectResponse(url="/docs")

if __name__ == "__main__":
    uvicorn.run("app.main:app", host="0.0.0.0", port=9000)