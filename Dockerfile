FROM python:3.8

ADD requirements.txt /requirements.txt
ADD entrypoint.sh /entrypoint.sh

RUN apt-get update && apt-get install libsasl2-dev python-dev libldap2-dev libssl-dev

RUN pip install --upgrade pip && pip install -r requirements.txt
RUN python3 --version ; pip --version ; pytest --version

RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
