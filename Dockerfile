FROM alpine as build

RUN apk add --no-cache --virtual opendp-build-dependecies \
    git \
    build-base \
    cmake \
    bison \
    flex \
    zlib-dev

ENV REVISION=master
RUN git clone --recursive --branch ${REVISION} https://github.com/kareefardi/OpenDP.git /opendp

WORKDIR /opendp/build

RUN cmake \
    -DCMAKE_INSTALL_PREFIX=/opt/opendp \
    ..
RUN make
RUN make install

