# Use the official PHP image
FROM php:8.2-apache

# Install PDO MySQL extension
RUN apt-get update && apt-get install -y iputils-ping telnet
RUN docker-php-ext-install pdo pdo_mysql mysqli


# Set the working directory
WORKDIR /var/www/html

# Expose port 80
EXPOSE 80
