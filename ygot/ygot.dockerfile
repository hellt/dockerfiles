FROM golang:1.22-bookworm AS builder
ARG VERSION=v0.29.20
RUN go install github.com/openconfig/ygot/generator@${VERSION}

FROM gcr.io/distroless/base-debian12
# FROM golang:1.22-bookworm
COPY --from=builder /go/bin/generator /
WORKDIR /work
CMD [ "/generator" ]
