FROM golang:1.18-alpine AS builder
ARG VERSION=v0.10.0
RUN apk add git
RUN go install github.com/segmentio/golines@v${VERSION} && go install golang.org/x/tools/cmd/goimports@latest

FROM golang:1.18-alpine
WORKDIR /work
COPY --from=builder /go/bin/golines /usr/local/bin
COPY --from=builder /go/bin/goimports /usr/local/bin
