# Use a base PHP image
FROM php:8.3-fpm

# Install required PHP extensions
RUN docker-php-ext-install mysqli pdo pdo_mysql

# Set up the working directory and copy application files
WORKDIR /var/www/html
COPY /app .

# Expose ports: PHP-FPM and web ports
EXPOSE 9000 80 443
