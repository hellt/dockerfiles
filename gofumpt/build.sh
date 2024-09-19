#!/usr/bin/env bash
set -e

# https://pkg.go.dev/mvdan.cc/gofumpt?tab=versions
if [ -z "$1" ]; then
    echo "Usage: $0 <version>"
    exit 1
fi

sudo docker build -t ghcr.io/hellt/gofumpt:$1 \
    --build-arg VERSION=$1 \
    -f gofumpt.dockerfile .