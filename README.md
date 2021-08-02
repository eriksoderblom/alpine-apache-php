# alpine-apache-php

Alpine based image with apache2 and php8

You can find a built image at Docker hub:
https://hub.docker.com/r/eriksoderblom/alpine-apache-php  
or use the image: *eriksoderblom/alpine-apache-php:latest*


## Modify the image to your preferences (Optional)

**Edit `start.sh` with your settings**  
Your email address, server domain name (Line 4, 5, 18, 19)  
Memory limit and timezone for php (Line 30, 31)

### Build

Replace *alpine-apache-php* and tags with whatever you want when building your own image.

```sh
docker build -t alpine-apache-php:latest .
```

### Run

Change `hostname.com`, port 80 and `/docker/data/www` with your own values.  
Use the image name from the previus step.

```sh
docker run --detach \
    --name alpine-apache-php \
    --hostname example.com \
    --publish 80:80 \
    --restart always \
    --volume /docker/data/www:/htdocs \
    alpine-apache-php:latest
```
