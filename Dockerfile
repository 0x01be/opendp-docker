FROM 0x01be/opendp:build as build

FROM alpine

RUN apk add --no-cache --virtual opendp-runtime-dependecies \
    libstdc++ \
    zlib

COPY --from=build /opt/opendp/ /opt/opendp/

