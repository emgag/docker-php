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
    if [ "$VERSION_MAIN" = "7.3" ]; then \
        docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/; \
    else \
        docker-php-ext-configure gd --with-freetype --with-jpeg; \
    fi \
    && docker-php-ext-install gd \
    && docker-php-ext-install calendar \
    && docker-php-ext-install exif \
    && docker-php-ext-install iconv \
    && docker-php-ext-install intl \
    && docker-php-ext-install mbstring \
    && docker-php-ext-install mysqli \
    && docker-php-ext-install opcache \
    && docker-php-ext-install pcntl \
    && docker-php-ext-install pdo_mysql \
    && docker-php-ext-install soap \
    && docker-php-ext-install xsl \
    && docker-php-ext-install zip \
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
