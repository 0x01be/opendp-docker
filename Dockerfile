FROM 0x01be/base as build

ENV REVISION=master
RUN apk add --no-cache --virtual opendp-build-dependecies \
    git \
    build-base \
    cmake \
    bison \
    flex \
    zlib-dev &&\
    git clone --recursive --branch ${REVISION} https://github.com/kareefardi/OpenDP.git /opendp

WORKDIR /opendp/build

RUN cmake \
    -DCMAKE_INSTALL_PREFIX=/opt/opendp \
    .. &&\
    make
RUN make install

FROM 0x01be/base

COPY --from=build /opt/opendp/ /opt/opendp/

RUN apk add --no-cache --virtual opendp-runtime-dependecies \
    libstdc++ \
    zlib

