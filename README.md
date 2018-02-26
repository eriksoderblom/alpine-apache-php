## alpine-apache-php
Alpine based image with apache2 and php7

[![](https://images.microbadger.com/badges/image/eriksoderblom/alpine-apache-php.svg)](https://microbadger.com/images/eriksoderblom/alpine-apache-php)

# Build
`docker build -t [image-name]:latest .`

# Usage

`docker run --detach \`  
&nbsp;&nbsp;&nbsp;&nbsp;`--hostname example.com \`  
&nbsp;&nbsp;&nbsp;&nbsp;`    --publish 80:80 \`  
&nbsp;&nbsp;&nbsp;&nbsp;`    --name alpine-php \`  
&nbsp;&nbsp;&nbsp;&nbsp;`    --restart always \`  
&nbsp;&nbsp;&nbsp;&nbsp;`    --volume /docker/data/www:/htdocs \`  
&nbsp;&nbsp;&nbsp;&nbsp;`    alpine-apache-php:latest`  
