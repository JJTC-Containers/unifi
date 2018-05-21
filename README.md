# UniFi Controller - http://wiki.ubnt.com/UniFi_FAQ

Ubnt UniFi Controller Alpine Linux (Edge) based docker image.

This image does not container the "libubnt_webrtc_jni.so" shared object library, because it is compiled with glibc and Alpine uses musl libc.


## Usage

### Prep
```
mkdir unifi
cd unifi
wget https://raw.githubusercontent.com/JJTC-Docker/unifi/master/docker-compose.yml
```

### Run
```
docker-compose up -d
```

https://github.com/JJTC-Docker/unifi