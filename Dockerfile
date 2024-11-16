FROM php:8.3-fpm

# Install necessary PHP extensions
RUN docker-php-ext-install mysqli pdo pdo_mysql
RUN docker-php-ext-enable mysqli
# Set working directory
WORKDIR /var/www/html
# Copy application files to the container
COPY test/ .
# Expose necessary ports
EXPOSE 9000 80 3306
# Start PHP-FPM
CMD ["php-fpm"]