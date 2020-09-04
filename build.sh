#!/bin/bash

mkdir -p build
cd build

repo init --depth=1 -u https://github.com/mkilivan/chaos-yocto-manifest.git
repo sync -c --no-tags --no-clone-bundle
cd poky
mkdir -p build/conf/
sed 's?_BUILD_PATH_?'`pwd`'?' ../conf/bblayers.conf.template > build/conf/bblayers.conf
source oe-init-build-env
bitbake chaos-image
