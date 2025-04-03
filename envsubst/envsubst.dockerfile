FROM alpine:3

RUN apk add gettext file
COPY envsubst.sh /usr/bin/envsubstfiles


WORKDIR /work

ENTRYPOINT [ "/usr/bin/envsubstfiles" ]