FROM golang:1.18-alpine AS builder
ARG VERSION=v0.5.0
RUN apk add git
RUN go install golang.org/x/tools/cmd/goimports@${VERSION}

FROM alpine:3
WORKDIR /work
COPY --from=builder /go/bin/goimports /usr/local/bin
WORKDIR /work
ENTRYPOINT [ "goimports" ]
