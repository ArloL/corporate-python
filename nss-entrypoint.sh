#!/bin/sh

set -o errexit
set -o nounset
set -o xtrace

/home/ansible/nss-wrapper.sh sh ./entrypoint.sh
