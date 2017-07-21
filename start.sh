#!/bin/sh

# Add ServerName to apache configuration
echo "ServerName localhost" >> /etc/apache2/apache2.conf

# Enable commonly used apache modules
sed -i 's/#LoadModule\ rewrite_module/LoadModule\ rewrite_module/' /etc/apache2/httpd.conf
sed -i 's/#LoadModule\ deflate_module/LoadModule\ deflate_module/' /etc/apache2/httpd.conf
sed -i 's/#LoadModule\ expires_module/LoadModule\ expires_module/' /etc/apache2/httpd.conf

# Modify php.ini settings
sed -i 's/memory_limit = .*/memory_limit = 256M/' /etc/php7/php.ini
sed -i "s/^;date.timezone =$/date.timezone = \"Europe\/Stockholm\"/" /etc/php7/php.ini

httpd -D FOREGROUND