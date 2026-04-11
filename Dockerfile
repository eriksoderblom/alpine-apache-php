FROM alpine:3.23
LABEL maintainer="erik.soderblom@gmail.com"
LABEL description="Alpine based image with apache2 and php8."

# Add user and define directory variables
ARG APPUSER=www
ARG APPUID=1000
ARG APPGID=1000
ENV APACHE_RUN_DIR=/var/run/apache2 \
    APACHE_LOG_DIR=/var/log/apache2 \
    APACHE_CFG_DIR=/etc/apache2 \
    APACHE_DOC_ROOT=/htdocs \
    APACHE_SSL_DIR=/etc/ssl/apache2/ \
    PHP_CFG_DIR=/etc/php85

# Setup apache and php and create runtime dirs
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
      php85-xml && \
    # create group/user and runtime dirs, set ownership and permissions
    addgroup -g ${APPGID} ${APPUSER} && \
    adduser -D -H -u ${APPUID} -G ${APPUSER} -s /sbin/nologin ${APPUSER} && \
    mkdir -p ${APACHE_DOC_ROOT} ${APACHE_RUN_DIR} ${APACHE_LOG_DIR} && \
    chown -R ${APPUSER}:${APPUSER} ${APACHE_DOC_ROOT} ${APACHE_RUN_DIR} \
    ${APACHE_LOG_DIR} ${APACHE_CFG_DIR} ${APACHE_CFG_DIR} ${PHP_CFG_DIR} \
    ${APACHE_SSL_DIR} && \
    rm -f ${APACHE_SSL_DIR}/server.*

EXPOSE 80 443

# Move entrypoint and ensure it's owned and executable
COPY docker-entrypoint.sh /docker-entrypoint.sh
RUN chown ${APPUSER}:${APPUSER} /docker-entrypoint.sh && chmod 750 /docker-entrypoint.sh

# Add custom log settings and ensure ownership
COPY custom-log.conf /etc/apache2/conf.d/custom-log.conf
RUN chown ${APPUSER}:${APPUSER} /etc/apache2/conf.d/custom-log.conf && chmod 640 /etc/apache2/conf.d/custom-log.conf

HEALTHCHECK CMD wget -q --no-cache --spider http://localhost || exit 1

# Switch to non-root user for runtime
USER ${APPUSER}

ENTRYPOINT ["/docker-entrypoint.sh"]
