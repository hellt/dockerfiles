#!/usr/bin/env bash
set -e

# https://pkg.go.dev/github.com/openconfig/ygot?tab=versions
if [ -z "$1" ]; then
    echo "Usage: $0 <version>"
    exit 1
fi

sudo docker build -t ghcr.io/hellt/ygot:$1 \
    --build-arg VERSION=$1 \
    -f ygot.dockerfile .