#!/bin/bash

DIR=$(dirname $(readlink -f "$0"))

export DOCKER_BUILDKIT=1

PLATFORM=linux/amd64,linux/arm64
PLATFORM=linux/amd64

(cd $DIR/..; docker buildx build --platform $PLATFORM --push -t ghcr.io/ixs/elkarbackup:latest -f docker/Dockerfile .)
