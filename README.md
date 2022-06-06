# Fast API TF-Model Serving

Reference project for serving machine/deep learning Tensorflow models.

Os modelos foram treinados no Google Collab por conta da utilização de GPUs/TPU para acelerar
o processo.  
Além disso, o Tensorflow em macOS requer [uma série de setups adicionais para funcionar 
normalmente](https://developer.apple.com/metal/tensorflow-plugin/)

### Jupyter Notebooks 
- Os Jupyter Notebooks de treinamento dos modelos estão localizados na pasta `notebooks` 
na raiz deste projeto

### Deep Learning Models
- Os modelos treinados estão na pasta `models` também na raiz deste projeto

### REST API
- O código fonte da API desenvolvida para fazer predições no modelo se localiza na pasta `app` na raiz deste projeto.
- Esta também pode ser acessada através da URL:  http://alb-fast-api-model-serving-v2-1905986998.us-east-1.elb.amazonaws.com:8000/

### Discord Bot
- O código fonte do Discord Bot pode ser encontrado neste repositório: https://github.com/iobruno/discord-bot
- E o mesmo responde aos comandos iniciados com: `?predict cifar10 <url_da_imagem>`, e.g.:

```
?predict cifar10 https://www.chevrolet.com.br/content/dam/chevrolet/mercosur/brazil/portuguese/index/cars/cars-subcontent/02-images/cruze-sport6-rs-carros.jpg
```

### Rodando a API Localmente

- A maneira mais eficiente de executar este projeto localmente é via [Docker](https://docs.docker.com/get-docker/), 
 para isso instale a versão do [Docker Desktop](https://docs.docker.com/get-docker/) correspondente ao seu Sistema Operacional. 
Em seguida, para criar uma imagem docker para sua máquina, execute o comando:

```
$ docker build -t iobruno/fastapi-model-serve:latest .
```

- Finalmente, para subir o projeto, execute: 
```
$ docker run -p 8000:8000/tcp -e PROTOCOL_BUFFERS_PYTHON_IMPLEMENTATION=python iobruno/fastapi-model-serve:latest
```

- Acesse a interface web da através da url:
```
http://localhost:8000
```


## Tech Stack

- Python 3.x
- Fast API
- Tensorflow (linux/x86_64, linux/aarch64) / Tensorflow-macos (macOS)
- [Poetry](https://python-poetry.org/docs/) for dependency management
- Docker, Docker-compose

## Up and Running

### Building a Docker Image:

```
$ make docker-image
```

### Running on Docker
```
$ make docker-run
```

### Local Development
**MUST READ for macOS (arm64: Apple Silicon or x86_64)**
- Tensorflow for macOS requires a slightly different Tensorflow install.  
- **Before proceeding**, follow [these detailed instructions](https://developer.apple.com/metal/tensorflow-plugin/) on how to install
`tensorflow-macos` and `tensorflow-metal`
- And then, run:

```
$ make setup
```
