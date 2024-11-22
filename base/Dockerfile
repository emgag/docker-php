ARG FLAVOUR
ARG VERSION
FROM php:${VERSION}-${FLAVOUR}-bookworm

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
        libpq-dev \
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
    && docker-php-ext-install -j$(nproc) bcmath \
      gd \
      calendar \
      exif \
      iconv \
      intl \
      mbstring \
      mysqli \
      opcache \
      pcntl \
      pdo_mysql \
      pdo_pgsql \
      soap \
      xsl \
      zip \
    && pecl install redis \
    && docker-php-ext-enable redis

# composer
RUN curl https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# php config
COPY php/php.ini /usr/local/etc/php/php.ini
COPY php/opcache.ini /usr/local/etc/php/conf.d/zz-00-opcache.ini
COPY php/session.ini /usr/local/etc/php/conf.d/zz-01-session.ini

# ioncube extension
ARG TARGETPLATFORM
COPY ioncube/$TARGETPLATFORM/ioncube_loaders_lin.tar.gz /usr/local/src
RUN \
  cd /usr/local/src/ \
  && tar xf ioncube_loaders_lin.tar.gz \
  && mv /usr/local/src/ioncube/ioncube_loader_lin_${VERSION_MAJOR}.${VERSION_MINOR}.so $(ls -d1 /usr/local/lib/php/extensions/*)/ioncube_loader_lin_${VERSION_MAJOR}.${VERSION_MINOR}.so \
  && chown root:root /usr/local/lib/php/extensions/*/ioncube_loader_lin_${VERSION_MAJOR}.${VERSION_MINOR}.so \
  && chmod 555 /usr/local/lib/php/extensions/*/ioncube_loader_lin_${VERSION_MAJOR}.${VERSION_MINOR}.so \
  && echo "zend_extension = ioncube_loader_lin_${VERSION_MAJOR}.${VERSION_MINOR}.so" > /usr/local/etc/php/conf.d/00-php-ext-ioncube.ini \
  && rm -rf /usr/local/src/ioncube_loaders_lin.tar.gz /usr/local/src/ioncube

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
