FROM alpine:3.23
LABEL maintainer="erik.soderblom@gmail.com"
LABEL description="Alpine based image with apache2 and php8."

# Setup apache and php
RUN apk --no-cache --update \
    add apache2 \
    apache2-ssl \
    curl \
    php85-apache2 \
    php85-bcmath \
    php85-bz2 \
    php85-calendar \
    php85-common \
    php85-ctype \
    php85-curl \
    php85-dom \
    php85-gd \
    php85-iconv \
    php85-mbstring \
    php85-mysqli \
    php85-mysqlnd \
    php85-openssl \
    php85-pdo_mysql \
    php85-pdo_pgsql \
    php85-pdo_sqlite \
    php85-phar \
    php85-session \
    php85-xml \
    && mkdir /htdocs

EXPOSE 80 443

ADD docker-entrypoint.sh /

HEALTHCHECK CMD wget -q --no-cache --spider localhost

ENTRYPOINT ["/docker-entrypoint.sh"]
