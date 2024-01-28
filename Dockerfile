FROM php:8.1 as php

RUN apt-get update -y && apt-get install -y \
    libicu-dev \
    libmariadb-dev \
    zlib1g-dev \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    vim \
    git \
    software-properties-common \
    unzip \
    libpq-dev \
    libcurl4-gnutls-dev

# PHP Extension
RUN docker-php-ext-install pdo pdo_mysql bcmath

WORKDIR /var/www
COPY . .

# Composer
COPY --from=composer:2.4.1 /usr/bin/composer /usr/bin/composer

ENV PORT=8000
ENTRYPOINT [ "docker/entrypoint.sh" ]
