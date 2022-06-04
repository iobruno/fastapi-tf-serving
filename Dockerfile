FROM python:3.7.3-stretch

ADD app /fastapi/app
ADD models /fastapi/models
ADD requirements.txt /fastapi/
ADD pyproject.toml /fastapi/

WORKDIR /fastapi

RUN pip install --upgrade pip
RUN pip install -r requirements.txt

ENTRYPOINT ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000", "--reload"]

EXPOSE 8000
