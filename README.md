# alpine-apache-php

Alpine based image with apache2 and php8

## Build

```sh
docker build -t alpine-apache-php:latest .
```

## Usage

```sh
docker run --detach 
    --name alpine-apache-php \
    --hostname example.com \
    --publish 80:80 \
    --restart always \
    --volume /docker/data/www:/htdocs \
    alpine-apache-php:latest
```
