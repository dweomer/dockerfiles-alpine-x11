ARG ALPINE_X_CLIENT="dweomer/alpine-x11:client"
FROM ${ALPINE_X_CLIENT}

ARG CHROMIUM_GID=8443
ARG CHROMIUM_UID=8080
ARG CHROMIUM_HOME=/data

RUN set -x \
 && addgroup -g ${CHROMIUM_GID} chromium \
 && adduser -D -G chromium -h ${CHROMIUM_HOME} -u ${CHROMIUM_UID} -S chromium \
 && apk --no-cache add \
    dumb-init \
    chromium \
 && chromium-browser -version

USER chromium

ENTRYPOINT ["dumb-init", "chromium-browser"]
CMD ["--help"]
