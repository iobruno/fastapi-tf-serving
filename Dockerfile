FROM amazonlinux:2

ADD app /fastapi/app
ADD models /fastapi/models
ADD pyproject.toml /fastapi/

WORKDIR /fastapi

ENV POETRY_VIRTUALENVS_CREATE=false

RUN amazon-linux-extras enable python3.8 &&  \
    yum install python38 pip -y && \
    update-alternatives --install /usr/bin/python python /usr/bin/python3.8 1 && \
    curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | python -

RUN $HOME/.poetry/bin/poetry install --no-root && \
    rm -Rf /root/.poetry && \
    rm -Rf /root/.local && \
    rm -Rf /usr/share/doc/ &&  \
    rm -Rf /tmp/ && \
    rm -Rf /var/cache

ENTRYPOINT ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000", "--reload"]

EXPOSE 8000
