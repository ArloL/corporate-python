#!/bin/sh

set -o errexit
set -o nounset
set -o xtrace

ls -lsa
whoami
ssh -V
nc -h
ansible-playbook --version
