FROM golang:1.18-alpine AS builder
ARG VERSION=v0.3.1
RUN apk add git
RUN go install mvdan.cc/gofumpt@${VERSION}

FROM alpine:3
WORKDIR /work
COPY --from=builder /go/bin/gofumpt /usr/local/bin
WORKDIR /work
ENTRYPOINT [ "gofumpt" ]
