FROM alpine:3.18
LABEL maintainer="erik.soderblom@gmail.com"
LABEL description="Alpine based image with apache2 and php8."

# Setup apache and php
RUN apk --no-cache --update \
    add apache2 \
    apache2-ssl \
    curl \
    php82-apache2 \
    php82-bcmath \
    php82-bz2 \
    php82-calendar \
    php82-common \
    php82-ctype \
    php82-curl \
    php82-dom \
    php82-gd \
    php82-iconv \
    php82-mbstring \
    php82-mysqli \
    php82-mysqlnd \
    php82-openssl \
    php82-pdo_mysql \
    php82-pdo_pgsql \
    php82-pdo_sqlite \
    php82-phar \
    php82-session \
    php82-xml \
    && mkdir /htdocs

EXPOSE 80 443

ADD docker-entrypoint.sh /

HEALTHCHECK CMD wget -q --no-cache --spider localhost

ENTRYPOINT ["/docker-entrypoint.sh"]
