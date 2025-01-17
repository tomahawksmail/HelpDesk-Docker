FROM php:fpm
LABEL maintainer="Luke Tainton <luke@tainton.uk>"
LABEL org.opencontainers.image.source="https://github.com/luketainton/hesk-docker"

# Set up PHP extensions
RUN apt-get update && \
    apt-get install -y libc-client-dev libkrb5-dev --no-install-recommends && \
    docker-php-ext-configure imap --with-kerberos --with-imap-ssl && \
    docker-php-ext-install mysqli imap && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Use the NFS share as the app directory
WORKDIR /srv
