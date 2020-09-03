ARG VERSION
FROM ghcr.io/emgag/php:${VERSION}-cli
LABEL maintainer="Matthias Blaser <mb@emgag.com>"

# install cronmutex
RUN cd /usr/local/bin && \
    curl -sfL -o cronmutex_0.6.0_linux_amd64.tar.gz \
    https://github.com/emgag/cronmutex/releases/download/v0.6.0/cronmutex_0.6.0_linux_amd64.tar.gz && \
    tar vxf cronmutex_0.6.0_linux_amd64.tar.gz

COPY cronmutex.yml /etc/cronmutex.yml
USER www-data
CMD ["/usr/local/bin/cronmutex", "daemon", "/srv/app/cron.yml"]
