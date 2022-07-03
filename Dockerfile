FROM python:3.10-slim-buster

ADD . /app

WORKDIR /app

RUN apt-get update && apt-get install git curl gcc unzip -y && \
    cd /app && pip install -r requirements.txt && \
    curl https://rclone.org/install.sh | bash && \
    apt-get remove git curl gcc unzip -y && apt-get autoremove -y

WORKDIR /app

CMD [ "python", "-u", "/app/tg_channel_downloader.py" ]