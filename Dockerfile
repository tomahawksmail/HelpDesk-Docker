# Use the official PHP image with FPM
FROM php:8.3-fpm

# Set working directory inside the container
WORKDIR /var/www/html

# Install necessary PHP extensions (e.g., for MySQL)
RUN apt-get update && apt-get install -y \
    libpng-dev libjpeg62-turbo-dev libfreetype6-dev \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install gd pdo pdo_mysql


# Set permissions
RUN chown -R www-data:www-data /var/www/html

# Expose PHP-FPM port
EXPOSE 9000 80

# Start PHP-FPM
CMD ["php-fpm"]
