ARG REPOSITORY="dweomer/alpine-x11"
ARG DRI_PACKAGES="libva-intel-driver mesa-dri-intel"
ARG SRV_PACKAGES="xf86-video-intel"

FROM ${REPOSITORY}:client AS client
ARG DRI_PACKAGES
RUN set -x \
 && apk --no-cache add \
    ${DRI_PACKAGES}

FROM ${REPOSITORY}:server AS server
ARG DRI_PACKAGES
ARG SRV_PACKAGES
RUN set -x \
 && apk --no-cache add \
    ${DRI_PACKAGES} \
    ${SRV_PACKAGES}
