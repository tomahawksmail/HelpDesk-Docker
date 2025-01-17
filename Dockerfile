FROM php:apache

# Set maintainer and source labels
LABEL maintainer="Luke Tainton <luke@tainton.uk>"
LABEL org.opencontainers.image.source="https://github.com/luketainton/hesk-docker"

# Copy application and configuration files
COPY --chown=www-data:www-data hesk /srv
COPY vhost.conf /etc/apache2/sites-enabled/000-default.conf

# Install necessary dependencies and PHP extensions
RUN apt-get update && \
    apt-get install -y libc-client-dev libkrb5-dev libssl-dev software-properties-common --no-install-recommends && \
    apt-get install -y --no-install-recommends build-essential && \
    docker-php-ext-configure imap --with-kerberos --with-imap-ssl && \
    docker-php-ext-install mysqli imap && \
    a2enmod rewrite && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /srv
