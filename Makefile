USER := mkilivan
REPO := image-builder-raspberrypi

IMAGE := $(USER)/$(REPO)

default: build

build:
	docker build -t $(IMAGE) .

sd-image: build
	docker run -ti \
		--mount type=bind,source="${HOME}"/shared,target=/home/build/shared \
		--mount type=bind,source="${HOME}"/.gitconfig, target=/home/build/.gitconfig \
		$(IMAGE)

shell: build
	docker run -ti \
		--mount type=bind,source="${HOME}"/shared,target=/home/build/shared \
		--mount type=bind,source="${HOME}"/.gitconfig,target=/home/build/.gitconfig \
		$(IMAGE) bash

push-image:
	docker push $(IMAGE)
