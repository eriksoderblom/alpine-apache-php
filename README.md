## alpine-apache-php
Alpine based image with apache2 and php7

[![](https://images.microbadger.com/badges/image/eriksoderblom/alpine-apache-php.svg)](https://microbadger.com/images/eriksoderblom/alpine-apache-php)

# Build
`docker build -t [image-name]:latest .`

# Usage

```
docker run --detach 
    --name alpine-apache-php \
    --hostname example.com \
    --publish 80:80 \
    --restart always \
    --volume /docker/data/www:/htdocs \
    alpine-apache-php:latest
```