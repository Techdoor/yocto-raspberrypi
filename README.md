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
$ repo init -u https://github.com/Techdoor/yocto-raspberrypi.git
$ repo sync
```
### Build
```
$ source oe-init-build-env 
$ bitbake rpi-hwup-image
```
