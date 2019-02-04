### Build
[![Build
Status](https://travis-ci.org/mkilivan/image-builder-raspberrypi.svg?branch=master)](https://travis-ci.org/mkilivan/image-builder-raspberrypi)

### Docker Image
[![](https://images.microbadger.com/badges/image/mkilivan/image-builder-raspberrypi.svg)](https://microbadger.com/images/mkilivan/image-builder-raspberrypi
"Get your own image badge on microbadger.com")
[![](https://images.microbadger.com/badges/version/mkilivan/image-builder-raspberrypi.svg)](https://microbadger.com/images/mkilivan/image-builder-raspberrypi
"Get your own version badge on microbadger.com")

### To Run the Docker Image
```
docker run -ti --volume=[host-src:]container-dest mkilivan/image-builder-raspberrypi
```
### Install Repo
```
mkdir ~/bin
PATH=~/bin:$PATH
curl https://storage.googleapis.com/git-repo-downloads/repo > ~/bin/repo
chmod a+x ~/bin/repo
```
### Download the Source
```
mkdir WORKING_DIRECTORY
cd WORKING_DIRECTORY
repo init -u https://github.com/mkilivan/image-builder-raspberrypi.git
repo sync
```
### Configure
```
source oe-init-build-env 
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
  /path/to/poky/meta-openembedded/meta-filesystems \
  /path/to/poky/meta-virtualization \
  /path/to/poky/meta-raspberrypi \
  "
```
### Build
```
bitbake core-image-base
````
### Flash the image to SD card
Assuming an SD card is attached as /dev/sdd, you can write the image to the card as follows:
```
sudo dd if=./tmp/deploy/images/raspberrypi2/core-image-base-raspberrypi2.rpi-sdimg of=/dev/sdd
```
