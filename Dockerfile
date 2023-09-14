FROM python:3.8

ADD requirements.txt /requirements.txt
ADD entrypoint.sh /entrypoint.sh

RUN apt-get update -y && apt-get install -y libsasl2-dev python-dev-is-python3 libldap2-dev libssl-dev javascript-common libjs-jquery libjs-sphinxdoc libjs-underscore libldap-dev libldap2-dev libpython3-dev libpython3.11 libpython3.11-dev libsasl2-dev python-is-python3 python3-dev python3.11-dev

RUN pip install --upgrade pip && pip install -r requirements.txt
RUN pip uninstall telebot 
RUN pip uninstall pyTelegramBotAPI
RUN pip install pyTelegramBotAPI python-telegram-bot-pagination
RUN python3 --version ; pip --version ; pytest --version

RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
