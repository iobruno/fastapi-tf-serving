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
- [PDM](https://pdm-project.org/latest/usage/dependency/)
- [Docker](https://docs.docker.com/get-docker/)


## Up and Running

**Building a Docker Image**:
```shell
make docker-image
```

**Running on Docker**:
```shell
make docker-run
```

**Local Development**:
```shell
make setup
```


## TODO
- [x] PEP-517: Packaging and dependency management with PDM
- [x] Code format/lint with Ruff
- [x] Run on Docker
- [ ] Serve it with Streamlit
- [ ] GitHub CI