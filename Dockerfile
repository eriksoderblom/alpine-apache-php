FROM alpine:3.6
LABEL maintainer="erik.soderblom@gmail.com"
LABEL description="Alpine based image with apache2 and php7."

# Setup apache and php
RUN apk --update \
    add apache2 \
    curl \
    php7-apache2 \
    php7-bcmath \
    php7-bz2 \
    php7-calendar \
    php7-ctype \
    php7-curl \
    php7-dom \
    php7-gd \
    php7-iconv \
    php7-json \
    php7-mbstring \
    php7-mcrypt \
    php7-mysqlnd \
    php7-openssl \
    php7-pdo_mysql \
    php7-pdo_pgsql \
    php7-pdo_sqlite \
    php7-phar \
    php7-xml \
    php7-xmlrpc \
    php7-zlib \
    && rm -f /var/cache/apk/* \
    && mkdir /run/apache2 \
    && mkdir -p /opt/utils

EXPOSE 80

ADD start.sh /opt/utils/

RUN chmod +x /opt/utils/start.sh

ENTRYPOINT ["/opt/utils/start.sh"]