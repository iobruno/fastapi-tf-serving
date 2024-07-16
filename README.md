# Fast API TF-Model Serving

![Python](https://img.shields.io/badge/Python-3.12_|_3.11_|_3.10-4B8BBE.svg?style=flat&logo=python&logoColor=FFD43B&labelColor=306998)
![Tensorflow](https://img.shields.io/badge/TensorFlow-2.16-FF7400.svg?style=flat&logo=tensorflow&logoColor=FF7400&labelColor=212121)
![FastAPI](https://img.shields.io/badge/FastAPI-0.104.1-009688.svg?style=flat&logo=FastAPI&logoColor=009688&labelColor=212121)
![Jupyter](https://img.shields.io/badge/Jupyter-31393F.svg?style=flat&logo=jupyter&logoColor=F37726&labelColor=31393F)
[![Ruff](https://img.shields.io/endpoint?url=https://raw.githubusercontent.com/astral-sh/ruff/main/assets/badge/v2.json)](https://github.com/astral-sh/ruff)
![Docker](https://img.shields.io/badge/Docker-329DEE?style=flat&logo=docker&logoColor=white&labelColor=329DEE)

![License](https://img.shields.io/badge/license-CC--BY--SA--4.0-31393F?style=flat&logo=creativecommons&logoColor=black&labelColor=white)

GitHub project for Tensorflow-based Object Detection on the CIFAR-10 dataset, served with FastAPI.


## Tech Stack
- [Tensorflow 2](https://www.tensorflow.org/guide)
- [FastAPI](https://fastapi.tiangolo.com/tutorial/)
- [PDM](https://pdm-project.org/latest/usage/dependency/)
- [Ruff](https://docs.astral.sh/ruff/configuration/)
- [Docker](https://docs.docker.com/get-docker/)


## Up and Running

**Building a Docker Image**:
```
$ make docker-image
```

**Running on Docker**:
```
$ make docker-run
```

**Local Development**:
```
$ make setup
```


## TODO
- [x] PEP-517: Packaging and dependency management with PDM
- [x] Code format/lint with Ruff
- [x] Run on Docker
- [ ] Serve it with Streamlit
- [ ] GitHub CI