
[![Build
Status](https://travis-ci.org/mkilivan/docker-yocto-builder.svg?branch=master)](https://travis-ci.org/mkilivan/docker-yocto-builder)
[![](https://images.microbadger.com/badges/image/mkilivan/docker-yocto-builder.svg)](https://microbadger.com/images/mkilivan/docker-yocto-builder
"Get your own image badge on microbadger.com")
[![](https://images.microbadger.com/badges/version/mkilivan/docker-yocto-builder.svg)](https://microbadger.com/images/mkilivan/docker-yocto-builder
"Get your own version badge on microbadger.com")

## Docker Yocto Builder
This version of yocto is also available on [DockerHub](https://hub.docker.com/r/mkilivan/docker-yocto-builder). You can pull the docker image from DockerHub using the command:
```
docker pull mkilivan/docker-yocto-builder
```

### Usage example
Supossing you're in a directory with a poky project, just run this:

````bash
docker run --rm --volume `pwd`:/tmp mkilivan/docker-yocto-builder \
       bash -c "cd poky && \
                source oe-init-build-env && \
                bitbake core-image-sato"
````

#### Possible Issues
Depending on the host system being run, when executing yocto builds, one might run into the following error:
```
ERROR: No space left on device or exceeds fs.inotify.max_user_watches?
```
Please check the max_user_watches value on your host system using:
```
cat /proc/sys/fs/inotify/max_user_watches
```
If the value is set too low (eg: 8192), use the following command to set it properly. Please ensure that you have root/sudo priviledges to do this.
```
sudo sysctl fs.inotify.max_user_watches=1000000
```
This should solve the problem with No space left on device errors.

### Flash the image to SD card
Assuming an SD card is attached as /dev/sdd, you can write the image to the card as follows:
```
sudo dd if=./tmp/deploy/images/raspberrypi3/chaos-image-base-raspberrypi3.rpi-sdimg of=/dev/sdd
```
