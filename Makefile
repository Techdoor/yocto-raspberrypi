USER := mkilivan
REPO := docker-yocto-builder

IMAGE := $(USER)/$(REPO)

default: build

build:
	docker build -t $(IMAGE) .

shell: build
	docker run -it \
		--volume ${CURDIR}:/tmp \
		$(IMAGE) bash

push:
	docker push $(IMAGE)
