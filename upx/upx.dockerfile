FROM alpine:3.18
RUN apk add --no-cache upx=4.0.2-r0
WORKDIR /work
ENTRYPOINT [ "upx" ]