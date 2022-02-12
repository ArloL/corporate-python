#!/bin/sh

set -o errexit
set -o nounset
set -o xtrace

whoami || true
ssh -V || true
nc -h || true
ansible-playbook --version || true
