USER := mkilivan
REPO := docker-yocto-builder

IMAGE := $(USER)/$(REPO)

default: build

build:
	docker build -t $(IMAGE) .

sd-image: build
	docker run -it \
		--volume ${CURDIR}:/tmp \
		$(IMAGE) \
		bash -c "build.sh"

shell: build
	docker run -it \
		--volume ${CURDIR}:/tmp \
		$(IMAGE) bash

push-image:
	docker push $(IMAGE)
