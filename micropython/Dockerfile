FROM python:3 as builder

ARG UPY_VERSION="v1.18"
RUN git clone --depth 1 -b ${UPY_VERSION} https://github.com/micropython/micropython.git && \
    cd micropython/ports/unix && make submodules && make

FROM python:3-slim as target
COPY --from=builder /micropython/ports/unix/micropython /usr/bin
RUN pip install black
WORKDIR /workdir
CMD ["/usr/bin/micropython"]