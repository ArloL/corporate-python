#!/bin/sh

set -o errexit
set -o nounset
set -o xtrace

./nss-wrapper.sh ./entrypoint.sh
