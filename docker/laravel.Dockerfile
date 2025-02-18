FROM php:8.2-fpm

RUN #sed -i 's|deb.debian.org|ftp.ru.debian.org|g' /etc/apt/sources.list
RUN find /etc/apt/sources.list.d/ -type f -exec sed -i 's|deb.debian.org|ftp.ru.debian.org|g' {} +


RUN apt update

RUN apt install -y \
    git \
    libpq-dev \
    libzip-dev \
    zip \
    unzip \
    libxml2-dev \
    curl

RUN docker-php-ext-install  \
    pdo  \
    pdo_pgsql  \
    zip \
    dom

RUN docker-php-ext-install zip

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

WORKDIR /app
RUN chown -R www-data:www-data /app

EXPOSE 20000