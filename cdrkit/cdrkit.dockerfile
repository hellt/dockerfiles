FROM alpine:3
LABEL org.opencontainers.image.source https://github.com/hellt/dockerfiles/tree/main/cdrkit
LABEL org.opencontainers.image.authors Roman Dodin <dodin.roman@gmail.com>
RUN apk add cdrkit=1.1.11-r3
