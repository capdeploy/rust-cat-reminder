#!/bin/bash

user=brichter
ip=192.168.64.3

set -o errexit
set -o nounset
set -o xtrace

rsync -a $user@$ip:~/cat-litter-reminder ~/workspace
sh deploy.sh
