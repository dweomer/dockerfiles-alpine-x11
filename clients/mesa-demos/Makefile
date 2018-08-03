REPOSITORY ?= dweomer/alpine-x11
APP         = $(notdir $(realpath .))
VARIANTS   ?= amd intel nvidia
BUILD       = build-$(APP) $(foreach var,$(VARIANTS),build-$(APP)-$(var))
PUSH        = push-$(APP) $(foreach var,$(VARIANTS),push-$(APP)-$(var))

build: $(BUILD)

$(BUILD):
	docker build \
		--build-arg ALPINE_X_CLIENT=$(REPOSITORY):$(subst build-$(APP),client,$@) \
		--tag $(REPOSITORY):$(subst build-$(APP),$(APP),$@) \
		.

push: $(PUSH)

$(PUSH):
	docker push $(REPOSITORY):$(subst push-$(APP),$(APP),$@)

.PHONY: build push $(BUILD) $(PUSH)
