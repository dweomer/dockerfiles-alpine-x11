# GNUmakefile

REPOSITORY ?= dweomer/alpine-x11
TARGETS    = client server
VARIANT    = $(notdir $(realpath .))
PUSH       = $(foreach tag,$(TARGETS),push-$(tag))

build: | $(TARGETS)

$(TARGETS): Dockerfile
	docker build \
	    --build-arg 'REPOSITORY=$(REPOSITORY)' \
		--tag $(REPOSITORY):$@-$(VARIANT) \
		--target $@ \
		.

push: | $(PUSH)

$(PUSH):
	docker push $(REPOSITORY):$(subst push-,,$@)-$(VARIANT)

.PHONY: build push $(TARGETS) $(PUSH)
