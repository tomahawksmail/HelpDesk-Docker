FROM php:apache
RUN apt-get update && docker-php-ext-install mysqli && apt-get install -y iputils-ping
WORKDIR /var/www/html/
COPY ./php.custom.ini /usr/local/etc/php/conf.d/php.custom.ini
EXPOSE 80 3306
