#!/bin/sh

set -o errexit
set -o nounset
set -o xtrace

cd "$(dirname "$0")" || exit 1

docker build \
  --build-arg PYTHON_BASE_VERSION \
  --tag "arlol/corporate-python:${PYTHON_BASE_VERSION}" \
  .
docker run \
  --rm \
  --interactive \
  --tty \
  --env HOME="/home/default" \
  --user 1001240000:1001240000 \
  --entrypoint "${PWD}/nss-entrypoint.sh" \
  --volume "${PWD}:${PWD}" \
  --workdir "${PWD}" \
  "arlol/corporate-python:${PYTHON_BASE_VERSION}"
