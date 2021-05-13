FROM python:3.7-alpine
RUN apk update

LABEL "com.github.actions.name"="GitHub Action for pytest-django"
LABEL "com.github.actions.description"="Run pytest-django commands"
LABEL "maintainer"="Sam Williams <swilliams.it@outlook.com>"

ADD requirements.txt /requirements.txt
ADD entrypoint.sh /entrypoint.sh

RUN apk add musl-dev openldap-dev gcc --no-cache bash

RUN pip install --upgrade pip
RUN pip install -r requirements.txt
RUN python --version ; pip --version ; pytest --version

RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
