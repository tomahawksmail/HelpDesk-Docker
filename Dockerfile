# Use PHP 8.3 as the base image
FROM php:8.3-fpm

# Install necessary PHP extensions
RUN apt-get update && apt-get install -y \
    libpq-dev \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install gd mysqli pdo pdo_mysql

# Set working directory
WORKDIR /var/www/html

# Copy your PHP application code into the container
COPY /app /var/www/html

# Set permissions (optional but recommended)
RUN chown -R www-data:www-data /var/www/html && \
    chmod 666 /var/www/html/hesk_settings.inc.php && \
    chmod 777 -R /var/www/html/attachments && \
    chmod 777 -R /var/www/html/cache

# Expose port 9987 for internal use
EXPOSE 9987 80

# Start PHP-FPM
CMD ["php-fpm"]