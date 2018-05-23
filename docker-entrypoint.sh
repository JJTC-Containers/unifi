#!/bin/sh

echo "Creating system.properties:"
echo "db.mongo.local=false" >> /var/lib/unifi/data/system.properties
echo "db.mongo.uri=mongodb\://mongo\:27017/unifi" >> /var/lib/unifi/data/system.properties
echo "statdb.mongo.uri=mongodb\://mongo\:27017/unifi_stat" >> /var/lib/unifi/data/system.properties
echo "unifi.db.name=unifi" >> /var/lib/unifi/data/system.properties


#chown unifi:unifi -R /var/log/unifi /run/unifi /var/lib/unifi /usr/lib/unifi /usr/share/java

echo "Starting UniFi Controller:"
#su-exec unifi:unifi java -Xmx1024m -Xms128m -XX:MaxDirectMemorySize=1024m -jar lib/ace.jar start
java -Xmx1024m -Xms128m -XX:MaxDirectMemorySize=1024m -jar lib/ace.jar start
