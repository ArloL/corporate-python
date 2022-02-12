#!/bin/sh

set -o errexit
set -o nounset
set -o xtrace

cd "$(dirname "$0")" || exit 1

pipenv lock \
    --keep-outdated \
    --requirements \
  >> requirements.txt
docker build \
  --tag arlol/ansible:latest \
  .
docker run \
  --rm \
  --interactive \
  --tty \
  --env HOME="${PWD}" \
  --user 1001240000:0 \
  --volume "${PWD}:${PWD}" \
  --workdir "${PWD}" \
  arlol/ansible:latest
