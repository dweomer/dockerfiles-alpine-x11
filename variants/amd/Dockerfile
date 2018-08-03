ARG REPOSITORY="dweomer/alpine-x11"
ARG DRI_PACKAGES="mesa-dri-ati"
ARG SRV_PACKAGES="xf86-video-amdgpu xf86-video-ati"

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
