#!/bin/bash

mkdir -p ~/dist
cd ~/dist

repo init -u https://github.com/mkilivan/yocto-raspberrypi.git
repo sync
cd poky
source oe-init-build-env 
cp ~/bblayers.conf conf/
cp ~/local.conf conf/
bitbake rpi-hwup-image
