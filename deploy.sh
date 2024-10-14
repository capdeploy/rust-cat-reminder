#!/bin/bash


user=brichter

set -o errexit
set -o nounset
set -o xtrace

allNodes=($ip)

readonly TARGET_HOST=$user@$ip
#readonly TARGET_HOST_2=$user@cat2.local
readonly TARGET_PATH=/home/$user/cat-litter-reminder
readonly TARGET_ARCH=armv7-unknown-linux-gnueabihf
readonly SOURCE_PATH=./target/${TARGET_ARCH}/release/cat-litter-reminder

cross build --release --target=${TARGET_ARCH}
for n in ${allNodes[@]}; do
  rsync ${SOURCE_PATH} $user@${n}.local:${TARGET_PATH}
done
