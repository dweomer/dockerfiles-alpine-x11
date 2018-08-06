ARG ALPINE_X_CLIENT="dweomer/alpine-x11:client"
FROM ${ALPINE_X_CLIENT}

ARG VIEWER_GID=5901
ARG VIEWER_UID=5901

RUN set -x \
 && addgroup -g ${VIEWER_GID} viewer \
 && adduser -D -G viewer -u ${VIEWER_UID} -S viewer \
 && apk --no-cache add \
    dbus \
    dumb-init \
    virt-viewer \
 && remote-viewer --version

USER viewer

ENTRYPOINT ["dumb-init", "--", "remote-viewer"]
CMD ["--help"]
