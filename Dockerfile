FROM python:3.7-alpine

RUN apk update
RUN apk add gcc
RUN apk add musl-dev
RUN apk add --no-cache bash

LABEL "com.github.actions.name"="GitHub Action for pytest-django"
LABEL "com.github.actions.description"="Run pytest-django commands"
LABEL "com.github.actions.icon"="upload-cloud"
LABEL "com.github.actions.color"="yellow"

ADD requirements.txt /requirements.txt

RUN pip install --upgrade pip
RUN pip install -r requirements.txt
RUN python --version ; pip --version ; pytest --version

COPY entrypoint.sh /
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
