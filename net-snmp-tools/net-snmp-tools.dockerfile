FROM alpine:3.20
ARG VERSION=5.9.4-r0
WORKDIR /work
RUN apk add net-snmp-tools=${VERSION}
