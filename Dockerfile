## Use a base PHP image
#FROM php:8.3-fpm
#
## Install required PHP extensions
#RUN docker-php-ext-install mysqli pdo pdo_mysql
#
## Set up the working directory and copy application files
#WORKDIR /var/www/html
#COPY /app .
#
## Expose ports: PHP-FPM and web ports
#EXPOSE 9000 80 3306

# Use the official PHP 8.3 image with FPM
FROM php:8.3-fpm

# Install necessary PHP extensions
RUN docker-php-ext-install mysqli pdo pdo_mysql

# Set working directory
WORKDIR /var/www/html

# Copy application files to the container
COPY . .


# Expose necessary ports
EXPOSE 9000 80 3306

# Start PHP-FPM
CMD ["php-fpm"]