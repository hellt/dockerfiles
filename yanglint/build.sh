#!/usr/bin/env bash
set -e

# https://github.com/CESNET/libyang/releases
if [ -z "$1" ]; then
    echo "Usage: $0 <version>"
    exit 1
fi

docker buildx build \
    --push \
    --platform linux/arm64,linux/amd64 \
    -t ghcr.io/hellt/yanglint:$1 \
    --build-arg VERSION=$1 \
    -f yanglint.dockerfile .