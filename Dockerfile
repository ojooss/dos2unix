FROM debian:stable-slim

RUN DEBIAN_FRONTEND=noninteractive apt update \
  && DEBIAN_FRONTEND=noninteractive apt install dos2unix \
  && DEBIAN_FRONTEND=noninteractive apt upgrade -y \
  && DEBIAN_FRONTEND=noninteractive apt clean

ADD dos2unix.sh /opt/dos2unix.sh

WORKDIR /dos2unix

ENTRYPOINT ["/usr/bin/bash", "/opt/dos2unix.sh"]
