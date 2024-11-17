from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from routers import predict
from starlette.responses import RedirectResponse

app = FastAPI()
app.include_router(predict.router)
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_methods=["*"],
    allow_headers=["*"],
    allow_credentials=True,
)


@app.get("/")
async def root():
    return RedirectResponse(url="/docs")
