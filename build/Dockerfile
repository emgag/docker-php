ARG FLAVOUR
ARG VERSION
FROM ghcr.io/emgag/php:${VERSION}-${FLAVOUR}

# php version
ARG VERSION
ARG VERSION_MAJOR
ARG VERSION_MINOR
ARG VERSION_PATCH
ENV VERSION_MAIN "${VERSION_MAJOR}.${VERSION_MINOR}"

# additional development tools
RUN apt-get update && apt-get install -y \
        default-mysql-client \
        redis-server \
        vim \
    && apt-get clean \
    && apt-get autoremove -y \
    && rm -rf /var/lib/apt/lists/*

# nodejs setup
RUN curl -sL https://deb.nodesource.com/setup_16.x | bash - \
    && apt-get install -y nodejs \
    && apt-get clean \
    && apt-get autoremove -y \
    && rm -rf /var/lib/apt/lists/*

RUN npm install -g npm
RUN npm install -g yarn

# php config
COPY php/opcache.ini /usr/local/etc/php/conf.d/zz-00-opcache.ini

# vim config
COPY vimrc /var/www/.vimrc
COPY vimrc /root/.vimrc
