FROM golang:1.21-alpine AS builder
ARG VERSION=v1.11.0
RUN apk add git
RUN go install gotest.tools/gotestsum@${VERSION}

FROM golang:1.21
WORKDIR /work
COPY --from=builder /go/bin/gotestsum /usr/local/bin
WORKDIR /work
ENTRYPOINT [ "gotestsum" ]
