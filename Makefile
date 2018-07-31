USER := mkilivan
REPO := image-builder-rpi

IMAGE := $(USER)/$(REPO)

default: build

build:
	docker build -t $(IMAGE) .

sd-image: build
	docker run -ti --privileged -v $(shell pwd):/home/build/shared:Z -v ${HOME}/.gitconfig:/home/build/.gitconfig $(IMAGE)

shell: build
	docker run -ti --privileged -v $(shell pwd):/home/build/shared:Z -v ${HOME}/.gitconfig:/home/build/.gitconfig $(IMAGE) bash

push-image:
	docker push $(IMAGE)
