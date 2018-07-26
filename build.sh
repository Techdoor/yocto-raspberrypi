#!/bin/bash

mkdir -p ~/shared/dist
cd ~/shared/dist

repo init -u https://github.com/mkilivan/yocto-raspberrypi.git
repo sync
cd poky
source oe-init-build-env 
cp ~/bblayers.conf conf/
cp ~/local.conf conf/
bitbake rpi-hwup-image
