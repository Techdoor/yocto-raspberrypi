#!/bin/bash

mkdir -p ~/shared/dist
cd ~/shared/dist

repo init -u https://github.com/mkilivan/yocto-raspberrypi.git
repo sync
cd poky
mkdir -p build/conf/
sed 's?_BUILD_PATH_?'`pwd`'?' ~/conf/bblayers.conf.template > build/conf/bblayers.conf
cp ~/conf/local.conf build/conf/
source oe-init-build-env 
bitbake rpi-hwup-image
