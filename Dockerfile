# Use PHP with FPM instead of Apache
FROM php:7.0-apache


# Install necessary dependencies and PHP extensions
RUN apt-get update && \
    apt-get install -y libc-client-dev libkrb5-dev libssl-dev software-properties-common build-essential && \
    docker-php-ext-configure imap --with-kerberos --with-imap-ssl && \
    docker-php-ext-install mysqli imap && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Copy application files
WORKDIR /var/www/html

# Expose port 9000 for PHP-FPM
EXPOSE 80


