FROM python:3.8

ADD requirements.txt /requirements.txt
ADD entrypoint.sh /entrypoint.sh

RUN pip install --upgrade pip
RUN pip install -r requirements.txt
RUN python --version ; pip --version ; pytest --version

RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
