FROM golang:1.18-alpine AS builder
ARG VERSION=v1.4.11
RUN apk add git
RUN go install github.com/tetafro/godot/cmd/godot@v${VERSION}

FROM alpine:3
WORKDIR /work
COPY --from=builder /go/bin/godot /usr/local/bin
WORKDIR /work
ENTRYPOINT [ "godot" ]
