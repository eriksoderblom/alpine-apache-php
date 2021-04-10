FROM alpine:3.13
LABEL maintainer="erik.soderblom@gmail.com"
LABEL description="Alpine based image with apache2 and php8."

# Setup apache and php
RUN apk --update \
    add apache2 \
    curl \
    php8-apache2 \
    php8-bcmath \
    php8-bz2 \
    php8-calendar \
    php8-common \
    php8-ctype \
    php8-curl \
    php8-dom \
    php8-gd \
    php8-iconv \
    php8-mbstring \
    php8-mysqli \
    php8-mysqlnd \
    php8-openssl \
    php8-pdo_mysql \
    php8-pdo_pgsql \
    php8-pdo_sqlite \
    php8-phar \
    php8-session \
    php8-xml \
    && rm -f /var/cache/apk/* \
    && mkdir -p /opt/utils \
    && mkdir /htdocs

EXPOSE 80

ADD start.sh /opt/utils/

RUN chmod +x /opt/utils/start.sh
RUN /opt/utils/start.sh

HEALTHCHECK CMD wget -q --no-cache --spider localhost/index.html

ENTRYPOINT ["httpd","-D","FOREGROUND"]
