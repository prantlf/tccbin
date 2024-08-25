FROM debian:stable-slim
LABEL maintainer="Ferdinand Prantl <prantlf@gmail.com>"

RUN apt-get update -y && \
  apt-get upgrade -y && \
  apt-get install -y --no-install-recommends binutils gcc git \
    libatomic-ops-dev libc-dev libgc-dev make texinfo && \
  apt-get clean && \
  rm -rf /var/cache/apt/archives/* && \
  rm -rf /var/lib/apt/lists/*

WORKDIR /opt/tinycc

COPY clone.sh /opt
RUN ../clone.sh

COPY build.sh test.c ./
RUN ./build.sh
