FROM alpine:3.5

ARG version=v0.14.26
ARG buildhost=https://github.com/syncthing/syncthing/releases/download/${version}
ARG tar_filename=syncthing-linux-amd64-${version}.tar.gz

ENV SYNCTHING_ROOT=/opt/syncthing
ENV SYNCTHING_BIN=$SYNCTHING_ROOT/bin
ENV PATH=$PATH:$SYNCTHING_BIN

VOLUME ["/opt/syncthing/config", "/opt/syncthing/data"]

RUN apk update \
 && apk add ca-certificates \
            wget \
 && update-ca-certificates \
 && wget ${buildhost}/${tar_filename} \
 && mkdir -p $SYNCTHING_ROOT $SYNCTHING_BIN \
 && tar xvf "${tar_filename}" -C $SYNCTHING_BIN --strip 1 \
 && rm "${tar_filename}"

WORKDIR $SYNCTHING_ROOT
CMD ["syncthing", \
       "-home=/opt/syncthing/config"]

EXPOSE 8384 22000 21027/udp
