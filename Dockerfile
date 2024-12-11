FROM php:apache
RUN apt-get update && docker-php-ext-install mysqli
WORKDIR /var/www/html/
COPY ./php.custom.ini /usr/local/etc/php/conf.d/php.custom.ini
EXPOSE 80
