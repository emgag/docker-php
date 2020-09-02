ARG FLAVOUR
ARG VERSION
ARG VERSION_MAJOR
ARG VERSION_MINOR
ARG VERSION_PATCH
FROM emgag/php:${VERSION}-${FLAVOUR}
LABEL maintainer="Matthias Blaser <mb@emgag.com>"

# additional development tools
RUN apt-get update && apt-get install -y \
        default-mysql-client \
        redis-server \
        vim \
    && apt-get clean \
    && apt-get autoremove -y \
    && rm -rf /var/lib/apt/lists/*

# nodejs setup
RUN curl -sL https://deb.nodesource.com/setup_12.x | bash - \
    && apt-get install -y nodejs \
    && apt-get clean \
    && apt-get autoremove -y \
    && rm -rf /var/lib/apt/lists/*

# force upgrade npm until patch is in package
# https://blog.npmjs.org/post/189618601100/binary-planting-with-the-npm-cli
RUN npm install -g npm

# yarn setup
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
    && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
    && apt-get update \
    && apt-get install yarn \
    && apt-get clean \
    && apt-get autoremove -y \
    && rm -rf /var/lib/apt/lists/*

# php config
COPY php/opcache.ini /usr/local/etc/php/conf.d/zz-00-opcache.ini

# vim config
COPY vimrc /var/www/.vimrc
COPY vimrc /root/.vimrc
