# alpine-apache-php
A simple and slim apache/php docker image using Alpine Linux

## Build
`docker build --no-cache -t [image-name]:latest .`

## Usage

`docker run --name=webapp -v /path/to/webapp:/app -p 80:80 [image-name]:latest`

The document root can be customized by using an env variable WEBAPP_ROOT to specify a subfolder containing the document app root.

`docker run --name=webapp -e "WEBAPP_ROOT=[Web app root if any, ex. public/]" -v /path/to/webapp:/app -p 80:80 [image-name]:latest`


docker run --detach \
       --hostname mudflap.lo \
       --publish 1080:80 \
       --name alpine-php \
       --restart always \
       -e "WEBAPP_ROOT=public/" \
       --volume /docker/data/www:/app \
       alpine-php:latest


## Notes 
This container will change the owner of all your files inside /path/to/webapp to apache:apache in order to be compatible with the apache installation inside the container.