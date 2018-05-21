FROM alpine:edge

ENV VER=5.7.23
ENV PKGS unifi-$VER-r0.apk unifi-doc-$VER-r0.apk

COPY . ./

RUN apk update \
&& apk add --no-cache --allow-untrusted $PKGS \
&& rm $PKGS \
\
&& mkdir -p /var/log/unifi/ \
&& mkdir -p /run/unifi/ \
&& ln -sf /dev/stdout /usr/lib/unifi/logs/server.log \
#&& mv libubnt_webrtc_jni.so /usr/lib/ \ # No musl version, so no cloud support
# Configure Unifi to use external MongoDB
&& cd /usr/lib/unifi/ \
&& echo "db.mongo.local=false" >> system.properties \
&& echo "db.mongo.uri=mongodb\://mongo\:27017/unifi" >> system.properties \
&& echo "statdb.mongo.uri=mongodb\://mongo\:27017/unifi_stat" >> system.properties \
&& echo "unifi.db.name=unifi" >> system.properties

WORKDIR /usr/lib/unifi

VOLUME /var/lib/unifi

EXPOSE 8443 8843 8880 8080

CMD ["java", "-Xmx1024m", "-Xms128m", "-XX:MaxDirectMemorySize=1024m", "-jar", "lib/ace.jar", "start"]
