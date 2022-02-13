#!/bin/sh

set -o errexit
set -o nounset
set -o xtrace

USER_ID=$(id -u)
GROUP_ID=$(id -g)

export LD_PRELOAD=libnss_wrapper.so

NSS_WRAPPER_PASSWD="$(mktemp)"
echo "${NSS_USER:-default}:x:${USER_ID}:${GROUP_ID}::${HOME}:/sbin/nologin" > "${NSS_WRAPPER_PASSWD}"

export NSS_WRAPPER_PASSWD
export NSS_WRAPPER_GROUP=/etc/group

"$@"
