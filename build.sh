#!/bin/bash

mkdir -p /workspace/dist
cd /workspace/dist

repo init -u ../.git
repo sync
#repo init -u https://github.com/mkilivan/yocto-raspberrypi.git
#repo sync
cd poky
source oe-init-build-env 
cp /workspace/bblayers.conf conf/
cp /workspace/local.conf conf/
bitbake rpi-hwup-image
