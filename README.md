# downloader
Telegram 频道/群组 文件下载脚本

Fork from [telegram_channel_downloader](https://github.com/snow922841/telegram_channel_downloader)

## 登录初始化session
```bash
docker run --rm -it --name telegram-downloader \
    -v $PWD/session:/app/session \
    -e API_ID='234543' \
    -e API_HASH='123456yuytredsxcvghy76543' \
    -e BOT_TOKEN='1234567:wertyuio' \
    -e ADMIN_ID='123456789' \
    nonedotone/telegram-downloader:latest
```

## 启动

### 下载
```bash
docker run --rm -it --name telegram-downloader \
    -v $PWD/session:/app/session \
    -v $PWD/downloads:/app/downloads \
    -e API_ID='234543' \
    -e API_HASH='123456yuytredsxcvghy76543' \
    -e BOT_TOKEN='1234567:wertyuio' \
    -e ADMIN_ID='123456789' \
    nonedotone/telegram-downloader:latest
```

### 下载并上传
```bash
docker run --rm --name tgdown \
    -v $PWD/session:/app/session \
    -v $PWD/downloads:/app/downloads \
    -v $HOME/.config/rclone:/root/.config/rclone \
    -e API_ID='234543' \
    -e API_HASH='123456yuytredsxcvghy76543' \
    -e BOT_TOKEN='1234567:wertyuio' \
    -e ADMIN_ID='123456789' \
    -e UPLOAD_FLAG=True \
    -e DRIVE_NAME='gc' \
    -e DRIVE_PATH='telegram/channel' \
    nonedotone/telegram-downloader:latest
```

### 下载上传，并且自动下载上传新消息
```bash
docker run --rm --name tgdown \
    -v $PWD/session:/app/session \
    -v $PWD/downloads:/app/downloads \
    -v $HOME/.config/rclone:/root/.config/rclone \
    -e API_ID='234543' \
    -e API_HASH='123456yuytredsxcvghy76543' \
    -e BOT_TOKEN='1234567:wertyuio' \
    -e ADMIN_ID='123456789' \
    -e UPLOAD_FLAG=True \
    -e DRIVE_NAME='gc' \
    -e DRIVE_PATH='telegram/channel' \
    -e DOWNLOAD_ALL=True \
    -e WHITE_LIST='chid-id 1517196500' \
    nonedotone/telegram-downloader:latest
```

* DOWNLOAD_ALL: 自动下载chat白名单
* WHITE_LIST: 空格间隔