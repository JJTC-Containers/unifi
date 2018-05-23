FROM alpine:edge

ENV VER=5.7.23
ENV PKGS unifi-$VER-r0.apk unifi-doc-$VER-r0.apk

COPY docker-entrypoint.sh unifi-$VER-r0.apk unifi-doc-$VER-r0.apk ./

RUN apk update \
  && apk add --no-cache --allow-untrusted snappy su-exec $PKGS \        
  && rm $PKGS \
  # Setup dirs and output
  && mkdir -p /var/log/unifi/ \
  && mkdir -p /run/unifi/ \
  && ln -sf /dev/stdout /usr/lib/unifi/logs/server.log \
  && chmod +x docker-entrypoint.sh \
  && mv docker-entrypoint.sh /usr/lib/unifi/

WORKDIR /usr/lib/unifi

VOLUME /var/lib/unifi

EXPOSE 3478/udp 8080/tcp 8443/tcp 8880/tcp 8843/tcp 6789:6789/tcp 10001/udp 1900/udp

ENTRYPOINT ["./docker-entrypoint.sh"]
