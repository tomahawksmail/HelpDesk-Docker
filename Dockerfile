FROM php:8.3-fpm

# Install necessary PHP extensions
RUN docker-php-ext-install mysqli pdo pdo_mysql
RUN docker-php-ext-enable mysqli
RUN apt-get update && apt-get install -y procps
RUN apt-get install net-tools
# Set working directory
WORKDIR /var/www/html
# Copy application files to the container
COPY app/ .
#COPY test/ .
# Expose necessary ports
EXPOSE 9000
# Start PHP-FPM
#CMD ["php-fpm"]

listen = /run/php/php8.3-fpm.sock
