#!/usr/bin/env bash

# Usage
# ./fetch_envoy.sh <ENVOY_SHA>
# ./fech_envoy.sh <envoy_version> 
# e.g. ./fetch_envoy v1.21.1
# Fetch docker image

set -eu

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
ENVOY_DIR="${DIR}/envoy"

mkdir -p $ENVOY_DIR

ENVOY_SHA=$1

# Since envoy doesn't publish a standalone binary yet, we fetch their docker
# image and extract the binary from it.
ENVOY_CONTAINER_ID=$(docker create envoyproxy/envoy:${ENVOY_SHA})

docker cp ${ENVOY_CONTAINER_ID}:/usr/local/bin/envoy "${ENVOY_DIR}/envoy"
docker rm ${ENVOY_CONTAINER_ID}

echo "${ENVOY_SHA}" > "${ENVOY_DIR}/ENVOY_SHA"