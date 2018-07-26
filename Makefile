default: build

build:
	docker build -t image-builder-rpi .

sd-image: build
	docker run -ti --privileged -v $(shell pwd):/workspace:Z -v ${HOME}/.gitconfig:/home/build/.gitconfig image-builder-rpi

shell: build
	docker run -ti --privileged -v $(shell pwd):/workspace:Z -v ${HOME}/.gitconfig:/home/build/.gitconfig image-builder-rpi bash
