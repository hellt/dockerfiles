FROM golang:1.22-bookworm AS builder
ARG VERSION=v0.25.0
RUN go install golang.org/x/tools/cmd/goimports@${VERSION}

FROM gcr.io/distroless/static-debian12
WORKDIR /work
COPY --from=builder /go/bin/goimports /goimports
ENTRYPOINT [ "/goimports" ]
