# UniFi Controller - http://wiki.ubnt.com/UniFi_FAQ

Ubnt UniFi Controller Alpine Linux (Edge) based docker image.

This image does not container the "libubnt_webrtc_jni.so" shared object library, because it is compiled with glibc and Alpine uses musl libc.


## Usage

### Prep
```
mkdir unifi
cd unifi
```

### Run
```
docker run -d \
  --name=unifi \
  -v $(pwd):/var/lib/unifi \
  -p 8080:8080 \
  -p 8081:8081 \
  -p 8443:8443 \
  -p 8843:8843 \
  -p 8880:8880 \
  jjtc/unifi
```

https://github.com/JJTC-Docker/unifi