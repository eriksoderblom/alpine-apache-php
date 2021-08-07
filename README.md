# alpine-apache-php

Alpine based image with apache2 and php8

You can find a built image at Docker hub:
https://hub.docker.com/r/eriksoderblom/alpine-apache-php
or use the image: *eriksoderblom/alpine-apache-php:latest*

## Define environnement variables (optional)

- `SERVER_ADMIN` (an email, defaults to `you@example.com`)
- `HTTP_SERVER_NAME` (a [server name](https://httpd.apache.org/docs/2.4/fr/mod/core.html#servername), defaults to `www.example.com`)
- `HTTPS_SERVER_NAME` (a [server name](https://httpd.apache.org/docs/2.4/fr/mod/core.html#servername), defaults to `www.example.com`)
- `LOG_LEVEL` (a [log level](https://httpd.apache.org/docs/2.4/fr/mod/core.html#loglevel), defaults to `info`)
- `TZ` (a [timezone](https://www.php.net/manual/timezones.php), defaults to `UTC`)
- `PHP_MEMORY_LIMIT` (a [memory-limit](https://www.php.net/manual/ini.core.php#ini.memory-limit), defaults to `256M`)

### Build

Replace *alpine-apache-php* and tags with whatever you want when building your own image.

```sh
docker build -t alpine-apache-php:latest .
```

### Run

Change the left side port *80*, *443* and `/docker/data/www` to your preferred values.  
You can use the image name from the previous step if you built your own image.

```sh
docker run --detach \
    --name alpine-apache-php \
    --publish 80:80 \
    --publish 443:443 \
    --restart unless-stopped \
    --volume /docker/data/www:/htdocs \
    eriksoderblom/alpine-apache-php:latest
```

#### Customized run

```sh
docker run --detach \
    --name alpine-apache-php-custom \
    --hostname alpine-apache-php.local \
    --env HTTP_SERVER_NAME="www.example.xyz" \
    --env HTTPS_SERVER_NAME="www.example.xyz" \
    --env SERVER_ADMIN="admin@example.xyz" \
    --env TZ="Europe/Paris" \
    --env PHP_MEMORY_LIMIT="512M" \
    --publish 80:80 \
    --publish 443:443 \
    --restart unless-stopped \
    --volume /docker/data/www:/htdocs \
    eriksoderblom/alpine-apache-php:latest
```
