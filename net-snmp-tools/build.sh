#!/usr/bin/env bash
set -e

# https://pkgs.alpinelinux.org/packages?name=net-snmp-tools&branch=v3.20&repo=&arch=&origin=&flagged=&maintainer=
if [ -z "$1" ]; then
    echo "Usage: $0 <version>"
    exit 1
fi

docker buildx build \
    --push \
    --platform linux/arm64,linux/amd64 \
    --tag ghcr.io/hellt/net-snmp-tools:$1 \
    --build-arg VERSION=$1 \
    -f net-snmp-tools.dockerfile .