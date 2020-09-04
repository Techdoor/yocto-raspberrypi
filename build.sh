#!/bin/bash

mkdir -p build
cd build

repo init --depth=1 -u https://github.com/mkilivan/chaos-yocto-manifest.git
repo sync -c --no-tags --no-clone-bundle
cd poky
TEMPLATECONF=meta-chaos/meta-chaos-common/conf source oe-init-build-env
bitbake chaos-image
