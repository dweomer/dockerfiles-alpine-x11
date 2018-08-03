ARG ALPINE_X_CLIENT="dweomer/alpine-x11:client"
FROM ${ALPINE_X_CLIENT}

RUN set -x \
 && apk --no-cache add \
    dumb-init \
    mesa-demos \
 && ln -vs /usr/share/mesa-demos /data

ENTRYPOINT ["dumb-init"]
CMD ["glxgears"]
