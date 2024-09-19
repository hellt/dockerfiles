FROM golang:1.22-bookworm AS builder
ARG VERSION=v0.3.1
# https://pkg.go.dev/mvdan.cc/gofumpt?tab=versions
RUN go install mvdan.cc/gofumpt@${VERSION}

FROM gcr.io/distroless/static-debian12
COPY --from=builder /go/bin/gofumpt /gofumpt
WORKDIR /work
ENTRYPOINT [ "/gofumpt" ]
