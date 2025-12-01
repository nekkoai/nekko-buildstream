.PHONY: build build-local build-docker docker-builder help all show-tag show-cache-image

# default image that is built; can be overridden by running `make LEGACY_IMAGE=your-image:tag build`
IMAGE_ORG ?= ghcr.io/nekkoai
TAG ?= latest
GIT_TAG ?= $(shell git log -n 1 --pretty=format:"%h")
DIRTY:=$(shell git update-index -q --refresh && git diff-index --quiet HEAD -- $(CURDIR) || echo "-dirty")
GIT_TAG_FINAL = $(GIT_TAG)$(DIRTY)
LEGACY_BASE ?= $(IMAGE_ORG)/nekko-legacy
LEGACY_IMAGE ?= $(LEGACY_BASE):$(TAG)
LEGACY_IMAGE_VERSIONED ?= $(LEGACY_BASE):$(GIT_TAG_FINAL)
CACHE_BASE ?= $(IMAGE_ORG)/nekko-buildstream-cache
CACHE_IMAGE?=$(CACHE_BASE):latest
CACHE_IMAGE_VERSIONED?=$(CACHE_BASE):$(GIT_TAG_FINAL)
RANDOM=$(shell echo $$RANDOM)

DIST_DIR := dist
dist:
	mkdir -p $(DIST_DIR)

DOCKER_BUILDER ?= nekko-builder

# Default target is help
all: help

# Show this help message
help:
	@echo "Available make targets:"
	@awk '/^#/{desc=$$0; next} /^[a-zA-Z0-9_-]+:([^=]|$$)/{gsub(/^# ?/, "", desc); printf "  %-20s %s\n", $$1, desc; desc=""}' $(MAKEFILE_LIST)

# show the image tag that will be used by default when building the image 
show-tag:
	@echo $(LEGACY_IMAGE)

show-tag-versioned:
	@echo $(LEGACY_IMAGE_VERSIONED)

show-cache-image:
	@echo $(CACHE_IMAGE)

show-cache-versioned:
	@echo $(CACHE_IMAGE_VERSIONED)

show-clean:
	@if [ -n "$(DIRTY)" ]; then exit 1; fi


# Build using default method of build-docker
build: build-docker

# Ensure we have a correct docker builder running
docker-builder:
	@if ! docker buildx inspect $(DOCKER_BUILDER) >/dev/null 2>&1; then \
	  echo "Creating docker buildx builder '$(DOCKER_BUILDER)'..."; \
	  docker buildx create --name $(DOCKER_BUILDER) --buildkitd-flags '--allow-insecure-entitlement security.insecure'; \
	else \
	  echo "Using existing docker buildx builder '$(DOCKER_BUILDER)'..."; \
	fi
	@docker buildx inspect $(DOCKER_BUILDER) --bootstrap >/dev/null

# Build using Docker; note that it *only* builds for linux/amd64 due to a buildstream bug; see the README.md. This is meant for running manually.
build-docker: docker-builder
	@echo "Building using Docker..."
	docker buildx build --builder $(DOCKER_BUILDER) --platform linux/amd64 --allow security.insecure --build-arg CACHE_IMAGE=$(CACHE_IMAGE) -t $(LEGACY_IMAGE) .
	@echo "Build complete.  The resulting artifact can be found in docker as $(LEGACY_IMAGE)."

# Build all containers using locally installed dependencies and tools
build-local: build-local-legacy build-local-lerobot build-local-tools build-local-inference

# Build container using locally installed dependencies and tools
build-local-%: BUILD_IMAGE=$(IMAGE_ORG)/nekko-$*:$(TAG)
build-local-%: TAR_FILE=$(DIST_DIR)/nekko-$*-root.tar
build-local-%: dist
	bst build nekko-$*-minimal.bst
	rm -f $(TAR_FILE)
	bst artifact checkout nekko-$*-minimal.bst --tar $(TAR_FILE)
	-docker image rm $(BUILD_IMAGE)
	docker image import $(TAR_FILE) $(BUILD_IMAGE)
	@echo "Build complete.  The resulting artifacts can be found in the '$(DIST_DIR)' directory and in docker as $(BUILD_IMAGE)."
