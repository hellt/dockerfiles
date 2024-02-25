#!/usr/bin/env bash
set -e

# https://pkg.go.dev/golang.org/x/tools/cmd/goimports?tab=versions
if [ -z "$1" ]; then
    echo "Usage: $0 <version>"
    exit 1
fi

sudo docker build -t ghcr.io/hellt/gcloud:$1 \
    --build-arg VERSION=$1 \
    -f gcloud.dockerfile .