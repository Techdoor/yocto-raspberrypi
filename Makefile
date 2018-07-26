default: build

build:
	docker build -t image-builder-rpi .

sd-image: build
	docker run -ti --privileged -v $(shell pwd):/home/build/shared:Z -v ${HOME}/.gitconfig:/home/build/.gitconfig image-builder-rpi

shell: build
	docker run -ti --privileged -v $(shell pwd):/home/build/shared:Z -v ${HOME}/.gitconfig:/home/build/.gitconfig image-builder-rpi bash
