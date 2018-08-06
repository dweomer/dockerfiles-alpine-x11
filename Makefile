# GNUmakefile

ALPINE     	= alpine:3.8
REPOSITORY 	= dweomer/alpine-x11
TARGETS    	= cli client server
GPUVARS   	= amd intel nvidia
CLIENTS     = chromium i3 mesa-demos virt-viewer
BUILD_T     = $(foreach tag,$(TARGETS),build-$(tag))
BUILD_G     = $(foreach var,$(GPUVARS),build-$(var))
BUILD_C     = $(foreach app,$(CLIENTS),build-$(app))
PUSH_T      = $(foreach tag,$(TARGETS),push-$(tag))
PUSH_G      = $(foreach var,$(GPUVARS),push-$(var))
PUSH_C      = $(foreach app,$(CLIENTS),push-$(app))

build: | pull-alpine build-base-targets build-gpu-variants build-app-clients
build-base-targets: | $(BUILD_T)
build-gpu-variants: | $(BUILD_G)
build-app-clients: | $(BUILD_C)

$(BUILD_T): Dockerfile
	docker build \
	    --build-arg ALPINE=$(ALPINE) \
		--tag $(REPOSITORY):$(subst build-,,$@) \
		--target $(subst build-,,$@) \
		.

$(BUILD_G):
	make -C ./variants/$(subst build-,,$@)/. REPOSITORY="$(REPOSITORY)" build

$(BUILD_C):
	make -C ./clients/$(subst build-,,$@)/. REPOSITORY="$(REPOSITORY)" VARIANTS="$(GPUVARS)" build

.PHONY: build build-base-targets build-gpu-variants build-app-clients $(BUILD_T) $(BUILD_G) $(BUILD_C)

push: | push-base-targets push-gpu-variants push-app-clients
push-base-targets: | $(PUSH_T)
push-gpu-variants: | $(PUSH_G)
push-app-clients: | $(PUSH_C)

$(PUSH_T):
	docker push $(REPOSITORY):$(subst push-,,$@)

$(PUSH_G):
	make -C ./variants/$(subst push-,,$@)/. REPOSITORY="$(REPOSITORY)" push

$(PUSH_C):
	make -C ./clients/$(subst push-,,$@)/. REPOSITORY="$(REPOSITORY)" VARIANTS="$(GPUVARS)" push

pull-alpine:
	docker pull $(ALPINE)

.PHONY: pull-alpine push push-base-targets push-gpu-variants push-app-clients $(PUSH_T) $(PUSH_G) $(PUSH_C)
