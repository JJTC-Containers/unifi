FROM alpine:edge

ENV PKGS unifi-5.5.24-r0.apk unifi-doc-5.5.24-r0.apk

COPY . ./

RUN apk update \
&& apk add --no-cache --allow-untrusted $PKGS \
&& rm $PKGS \
\
&& mkdir -p /var/lib/unifi/ \
&& mkdir -p /var/log/unifi/ \
&& ln -sf /usr/lib/unifi/data /var/lib/unifi/data \
&& ln -sf /usr/lib/unifi/logs /var/lib/unifi/logs \
&& ln -sf /usr/lib/unifi/run /var/lib/unifi/run \
&& ln -sf /usr/lib/unifi/logs/mongod.log /var/log/mongodb/mongod.log \
&& ln -sf /usr/lib/unifi/logs/server.log /var/log/unifi/server.log \
&& ln -sf /dev/stdout /usr/lib/unifi/logs/server.log
#&& mv libubnt_webrtc_jni.so /usr/lib/

WORKDIR /usr/lib/unifi

VOLUME /var/lib/unifi

EXPOSE 8443 8843 8880 8080

CMD ["java", "-Xmx128m", "-jar", "lib/ace.jar", "start"]