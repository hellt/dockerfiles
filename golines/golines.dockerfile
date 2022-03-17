FROM golang:1.17-alpine AS builder
RUN apk add git
RUN go install github.com/segmentio/golines@v0.8.0 && go install golang.org/x/tools/cmd/goimports@latest

FROM alpine:3
WORKDIR /work
COPY --from=builder /go/bin/golines /usr/local/bin
COPY --from=builder /go/bin/goimports /usr/local/bin
