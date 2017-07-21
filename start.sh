#!/bin/sh

# Enable commonly used apache modules
echo "ServerName localhost" >> /etc/apache2/apache2.conf
sed -i 's/#LoadModule\ rewrite_module/LoadModule\ rewrite_module/' /etc/apache2/httpd.conf
sed -i 's/#LoadModule\ deflate_module/LoadModule\ deflate_module/' /etc/apache2/httpd.conf
sed -i 's/#LoadModule\ expires_module/LoadModule\ expires_module/' /etc/apache2/httpd.conf

sed -i "s#^DocumentRoot \".*#DocumentRoot \"/app/$WEBAPP_ROOT\"#g" /etc/apache2/httpd.conf
sed -i "s#/var/www/localhost/htdocs#/app/$WEBAPP_ROOT#" /etc/apache2/httpd.conf
printf "\n<Directory \"/app/$WEBAPP_ROOT\">\n\tAllowOverride All\n</Directory>\n" >> /etc/apache2/httpd.conf
#chown -R apache:apache /app
sed -i 's/memory_limit = .*/memory_limit = 256M/' /etc/php7/php.ini
sed -i "s/^;date.timezone =$/date.timezone = \"Europe\/Stockholm\"/" /etc/php7/php.ini

httpd -D FOREGROUND