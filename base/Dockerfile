ARG FLAVOUR
ARG VERSION
FROM php:${VERSION}-${FLAVOUR}-buster
LABEL maintainer="Matthias Blaser <mb@emgag.com>"

# php version
ARG VERSION
ARG VERSION_MAJOR
ARG VERSION_MINOR
ARG VERSION_PATCH
ENV VERSION_MAIN "${VERSION_MAJOR}.${VERSION_MINOR}"

# image upgrade, install dependencies and tools
RUN apt-get update \
    && apt-get -y upgrade \
    && apt-get install -y \
        curl \
        gettext-base \
        git \
        gnupg \
        iproute2 \
        libfreetype6-dev \
        libicu-dev \
        libjpeg62-turbo-dev \
        libonig-dev \
        libpng-dev \
        libwebp-dev \
        libxslt1-dev \
        libzip-dev \
        locales \
        rsync \
        sudo \
        tmux \
        unzip \
    && apt-get clean \
    && apt-get autoremove -y \
    && rm -rf /var/lib/apt/lists/*

# generate locales
COPY locale.gen /etc/locale.gen
RUN locale-gen

# php extensions
RUN \
    docker-php-ext-configure gd --with-freetype --with-jpeg --with-webp \
    && docker-php-ext-install -j$(nproc) gd \
    && docker-php-ext-install -j$(nproc) calendar \
    && docker-php-ext-install -j$(nproc) exif \
    && docker-php-ext-install -j$(nproc) iconv \
    && docker-php-ext-install -j$(nproc) intl \
    && docker-php-ext-install -j$(nproc) mbstring \
    && docker-php-ext-install -j$(nproc) mysqli \
    && docker-php-ext-install -j$(nproc) opcache \
    && docker-php-ext-install -j$(nproc) pcntl \
    && docker-php-ext-install -j$(nproc) pdo_mysql \
    && docker-php-ext-install -j$(nproc) soap \
    && docker-php-ext-install -j$(nproc) xsl \
    && docker-php-ext-install -j$(nproc) zip \
    && pecl install redis \
    && docker-php-ext-enable redis

# composer
RUN curl https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# php config
COPY php/php.ini /usr/local/etc/php/php.ini
COPY php/opcache.ini /usr/local/etc/php/conf.d/zz-00-opcache.ini
COPY php/session.ini /usr/local/etc/php/conf.d/zz-01-session.ini

# bash config
COPY aliases.sh /etc/profile.d/aliases.sh
COPY path.sh /etc/profile.d/path.sh

# load bash profile for www user & root
COPY bashrc /var/www/.bashrc
COPY bashrc /root/.bashrc

# readline config
COPY inputrc /var/www/.inputrc
COPY inputrc /root/.inputrc

# tmux config
COPY tmux.conf /etc/tmux.conf

# enable console access for www-data
RUN usermod -s /bin/bash www-data
