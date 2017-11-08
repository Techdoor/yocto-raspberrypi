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
  /home/murat/raspberryYocto/poky/meta \
  /home/murat/raspberryYocto/poky/meta-poky \
  /home/murat/raspberryYocto/poky/meta-openembedded/meta-oe \
  /home/murat/raspberryYocto/poky/meta-openembedded/meta-multimedia \
  /home/murat/raspberryYocto/poky/meta-openembedded/meta-networking \
  /home/murat/raspberryYocto/poky/meta-openembedded/meta-python \
  /home/murat/raspberryYocto/poky/meta-raspberrypi \
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
