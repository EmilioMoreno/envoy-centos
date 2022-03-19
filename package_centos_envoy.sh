#!/usr/bin/env bash

# Usage:
# ./package_centos_envoy.sh

set -eu

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
ENVOY_DIR="${DIR}/envoy"

# Use our envoy packaging image to do our custom glibc build and patch the envoy binary to use it.
docker build -f "${ENVOY_DIR}/Dockerfile-package-envoy" -t centos-envoy-package:build "${ENVOY_DIR}"

PACKAGE_CONTAINER_ID=$(docker create centos-envoy-package:build)

docker cp ${PACKAGE_CONTAINER_ID}:/package/envoy.tar "${ENVOY_DIR}/centos-envoy.tar"
docker rm ${PACKAGE_CONTAINER_ID}