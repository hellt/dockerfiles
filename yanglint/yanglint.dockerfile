FROM python:3 AS builder

ARG VERSION=3.4.2

RUN apt update && apt -y install build-essential git --no-install-recommends
RUN pip install apkg
RUN git clone https://github.com/CESNET/libyang.git

WORKDIR /libyang

RUN git checkout v${VERSION} && apkg build -i
RUN bash -c "mkdir -p /tmp/pkg && mv pkg/pkgs/debian-*/libyang*/libyang-tools_*.deb /tmp/pkg/libyang-tools.deb && \
    mv pkg/pkgs/debian-*/libyang*/libyang3_*.deb /tmp/pkg/libyang.deb"

FROM public.ecr.aws/docker/library/debian:bookworm-slim
COPY --from=builder /tmp/pkg /tmp/pkg
RUN dpkg -i /tmp/pkg/*.deb
WORKDIR /work

CMD [ "yanglint" ]