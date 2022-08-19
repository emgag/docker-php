ARG VERSION
FROM ghcr.io/emgag/php:${VERSION}-cli

# https://github.com/docker/cli/blob/master/docs/reference/builder.md#automatic-platform-args-in-the-global-scope
ARG TARGETPLATFORM
ARG TARGETARCH
ARG TARGETOS

# install cronmutex
RUN cd /usr/local/bin && \
    curl -sfL -o cronmutex_0.7.0_linux_${TARGETARCH}.tar.gz \
    https://github.com/emgag/cronmutex/releases/download/v0.7.0/cronmutex_0.7.0_linux_${TARGETARCH}.tar.gz && \
    tar vxf cronmutex_0.7.0_linux_${TARGETARCH}.tar.gz

COPY cronmutex.yml /etc/cronmutex.yml
USER www-data
CMD ["/usr/local/bin/cronmutex", "daemon", "/srv/app/cron.yml"]
