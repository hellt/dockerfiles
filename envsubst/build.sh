#!/usr/bin/env bash
set -e

if [ -z "$1" ]; then
    echo "Usage: $0 <version>"
    exit 1
fi

docker buildx build \
    --push \
    --platform linux/arm64,linux/amd64 \
    -t ghcr.io/hellt/envsubst:$1 \
    -f envsubst.dockerfile .