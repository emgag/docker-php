ARG VERSION
ARG FLAVOUR
FROM php:${VERSION}-${FLAVOUR}-stretch
LABEL maintainer="Matthias Blaser <mb@emgag.com>"

# php & composer setup
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
        sudo \
        unzip \
    && apt-get clean \
    && apt-get autoremove -y \
    && rm -rf /var/lib/apt/lists/* \
    && docker-php-ext-install iconv \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install gd \
    && docker-php-ext-install exif
RUN docker-php-ext-install pdo_mysql
RUN docker-php-ext-install mbstring
RUN docker-php-ext-install xsl
RUN docker-php-ext-install intl
RUN docker-php-ext-install opcache
RUN docker-php-ext-install zip
RUN docker-php-ext-install calendar
RUN pecl install redis
RUN docker-php-ext-enable redis
COPY php.ini /usr/local/etc/php/php.ini

# generate locales
COPY locale.gen /etc/locale.gen
RUN locale-gen

# composer
RUN curl https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# add some aliases
COPY aliases.sh /etc/profile.d/aliases.sh


