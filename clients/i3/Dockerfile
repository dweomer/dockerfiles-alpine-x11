ARG ALPINE_X_CLIENT="dweomer/alpine-x11:client"
FROM ${ALPINE_X_CLIENT}

RUN set -x \
 && apk --no-cache add \
    dumb-init \
    feh \
    i3wm \
    setxkbmap \
    ttf-dejavu \
    xkeyboard-config \
 && i3 -version

COPY ./scripts/   /opt/i3/bin/
COPY ./wallpaper  /opt/i3/share/

RUN set -x \
 && chmod -v +x /opt/i3/bin/* \
 && sed -e 's/\(^exec\)/# \1/g' < /etc/i3/config > /opt/i3/config \
 && echo 'exec /opt/i3/bin/set-dpms-off'        >> /opt/i3/config \
 && echo 'exec /opt/i3/bin/set-screensaver-off' >> /opt/i3/config \
 && echo 'exec /opt/i3/bin/set-wallpaper'       >> /opt/i3/config
 
ENV I3_WALLPAPER=/usr/share/feh/images/feh.png

ENTRYPOINT ["dumb-init","i3"]
CMD ["-c","/opt/i3/config"]
