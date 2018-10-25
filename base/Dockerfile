ARG VERSION
ARG FLAVOUR
FROM php:${VERSION}-${FLAVOUR}-stretch
LABEL maintainer="Matthias Blaser <mb@emgag.com>"

# dependencies and tools
RUN apt-get update && apt-get install -y \
        curl \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libpng-dev \
        libxslt1-dev \
        libicu-dev \
        locales \
        git \
        gnupg \
        iproute2 \
        sudo \
        unzip \
    && apt-get clean \
    && apt-get autoremove -y \
    && rm -rf /var/lib/apt/lists/*

# generate locales
COPY locale.gen /etc/locale.gen
RUN locale-gen

# php extensions
RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
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
COPY php.ini /usr/local/etc/php/php.ini

# add some aliases
COPY aliases.sh /etc/profile.d/aliases.sh
