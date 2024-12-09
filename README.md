# FastAPI TensorFlow Serving

![Python](https://img.shields.io/badge/Python-3.11_|_3.10-4B8BBE.svg?style=flat&logo=python&logoColor=FFD43B&labelColor=306998)
![Tensorflow](https://img.shields.io/badge/TensorFlow-2.16-FF7400.svg?style=flat&logo=tensorflow&logoColor=FF7400&labelColor=212121)
![FastAPI](https://img.shields.io/badge/FastAPI-0.111-009688.svg?style=flat&logo=FastAPI&logoColor=009688&labelColor=212121)
![Jupyter](https://img.shields.io/badge/Jupyter-31393F.svg?style=flat&logo=jupyter&logoColor=F37726&labelColor=31393F)
![Docker](https://img.shields.io/badge/Docker-329DEE?style=flat&logo=docker&logoColor=white&labelColor=329DEE)

![License](https://img.shields.io/badge/license-CC--BY--SA--4.0-31393F?style=flat&logo=creativecommons&logoColor=black&labelColor=white)

GitHub project for Tensorflow-based Object Detection on the CIFAR-10 dataset, served with FastAPI.

## Tech Stack
- [Tensorflow 2](https://www.tensorflow.org/guide)
- [FastAPI](https://fastapi.tiangolo.com/tutorial/)
- [uv](https://docs.astral.sh/uv/getting-started/installation/)
- [Docker](https://docs.docker.com/get-docker/)

## Up and Running

### Developer Setup 

**1.** Install the dependencies on `pyproject.toml`:
```shell
uv sync
```

**2.** Activate the virtualenv created by `uv`:
```shell
source .venv/bin/activate
```

**3.** Start the app with `gunicorn` with:
```shell
uvicorn --app-dir app/ main:app --host 0.0.0.0 --port 8000 --reload
```
or simply execute:
```
make run
```

**4.** Access the Swagger UI at:
```
open http://localhost:8000
```

## Containerization and Testing

**1.** Build the Docker Image with:

```shell
make docker-image
```

**2.** Spin up the container with:
```shell
make docker-run
```

**3.** Access the Swagger UI at:
```
open http://localhost:8000
```

## TODO
- [x] PEP-517: Packaging and dependency management with PDM
- [x] Code format/lint with Ruff
- [x] Run on Docker
- [ ] Serve it with Streamlit
- [ ] GitHub CI