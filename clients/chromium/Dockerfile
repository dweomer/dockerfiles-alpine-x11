ARG ALPINE_X_CLIENT="dweomer/alpine-x11:client"
FROM ${ALPINE_X_CLIENT}

RUN set -x \
 && apk --no-cache add \
    dumb-init \
    chromium \
 && chromium-browser -version

ENTRYPOINT ["dumb-init", "chromium-browser"]
