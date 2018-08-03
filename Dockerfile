ARG ALPINE="alpine:3.8"
ARG SERVER_INPUT_PKGS="xf86-input-evdev xf86-input-keyboard xf86-input-libinput xf86-input-mouse xf86-input-synaptics xf86-input-vmmouse"
ARG SERVER_VIDEO_PKGS="xf86-video-vesa"

FROM ${ALPINE} AS cli

RUN set -x \
 && apk --no-cache add \
    xauth \
    xset


FROM cli AS client

RUN set -x \
 && apk --no-cache add \
    libva \
    libva-glx \
    libx11 \
    libxcb \
    libxft \
    libxpm \
    libxv \
    libxvmc \
    mesa-egl \
    mesa-dri-swrast \
    pango \
    ttf-dejavu


FROM client AS server

ARG SERVER_INPUT_PKGS
ARG SERVER_VIDEO_PKGS

RUN set -x \
 && apk --no-cache add \
    ${SERVER_INPUT_PKGS} \
    ${SERVER_VIDEO_PKGS} \
     xorg-server \
 && X -version

ENTRYPOINT ["X"]
CMD ["-help"]
