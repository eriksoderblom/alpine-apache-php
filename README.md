# alpine-apache-php
A simple and slim apache/php docker image using Alpine Linux

## Build
`docker build -t [image-name]:latest .`

## Usage

`docker run --detach \
       --hostname example.com \
       --publish 80:80 \
       --name alpine-php \
       --restart always \
       -e "WEBAPP_ROOT=public/" \
       --volume /docker/data/www:/app \
       alpine-php:latest
`

The document root can be customized by using an env variable WEBAPP_ROOT to specify a subfolder containing the document app root.
