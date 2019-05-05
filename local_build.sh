#!/bin/bash

repo init -u https://github.com/mkilivan/image-builder-raspberrypi.git
repo sync
cd poky
mkdir -p build/conf/
sed 's?_BUILD_PATH_?'`pwd`'?' ../conf/bblayers.conf.template > build/conf/bblayers.conf
source oe-init-build-env
bitbake chaos-image
