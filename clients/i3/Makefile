REPOSITORY ?= dweomer/alpine-x11
TAG    		= $(notdir $(realpath .))

build: Dockerfile
	docker build \
		--tag $(REPOSITORY):$(TAG) \
		.

push:
	docker push $(REPOSITORY):$(TAG)

.PHONY: build push
