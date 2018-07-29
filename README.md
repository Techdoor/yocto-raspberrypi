[![Build
Status](https://travis-ci.org/mkilivan/yocto-raspberrypi.svg?branch=master)](https://travis-ci.org/mkilivan/yocto-raspberrypi)
[![](https://images.microbadger.com/badges/image/mkilivan/yocto-build.svg)](https://microbadger.com/images/mkilivan/yocto-build
"Get your own image badge on microbadger.com")
[![](https://images.microbadger.com/badges/version/mkilivan/yocto-build.svg)](https://microbadger.com/images/mkilivan/yocto-build
"Get your own version badge on microbadger.com")

### Install Repo
```
$ mkdir ~/bin
$ PATH=~/bin:$PATH
$ curl https://storage.googleapis.com/git-repo-downloads/repo > ~/bin/repo
$ chmod a+x ~/bin/repo
```
### Download the Source
```
$ mkdir WORKING_DIRECTORY
$ cd WORKING_DIRECTORY
$ repo init -u https://github.com/mkilivan/yocto-raspberrypi.git
$ repo sync
```
### Configure
```
$ source oe-init-build-env 
```
Edit conf/bblayers.conf file. It should look like (Note: change absolute path to your home directory) 
```
BBLAYERS ?= " \
  /path/to/poky/meta \
  /path/to/poky/meta-poky \
  /path/to/poky/meta-openembedded/meta-oe \
  /path/to/poky/meta-openembedded/meta-multimedia \
  /path/to/poky/meta-openembedded/meta-networking \
  /path/to/poky/meta-openembedded/meta-python \
  /path/to/poky/meta-openembedded/meta-filesystem \
  /path/to/poky/meta-virtualization \
  /path/to/poky/meta-raspberrypi \
  "
```
### Build
```
$ bitbake rpi-hwup-image
````
### Flash the image to SD card
Assuming an SD card is attached as /dev/sdd, you can write the image to the card as follows:
```
sudo dd if=./tmp/deploy/images/raspberrypi3/rpi-hwup-image-raspberrypi3.rpi-sdimg of=/dev/sdd
```
