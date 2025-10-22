.PHONY: build build-local build-docker docker-builder help all

# image that is built; can be overridden by running `make IMAGE=your-image:tag build`
IMAGE ?= ghcr.io/nekkoai/nekko-legacy:latest
DIST  ?= dist

DOCKER_BUILDER ?= nekko-builder

# Default target is help
all: help

# Show this help message
help:
	@echo "Available make targets:"
	@awk '/^#/{desc=$$0; next} /^[a-zA-Z0-9_-]+:([^=]|$$)/{gsub(/^# ?/, "", desc); printf "  %-20s %s\n", $$1, desc; desc=""}' $(MAKEFILE_LIST)

# show the image tag that will be used by default when building the image 
show-tag:
	@echo $(IMAGE)

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
	docker buildx build --builder $(DOCKER_BUILDER) --platform linux/amd64 --allow security.insecure -t $(IMAGE) .
	@echo "Build complete.  The resulting artifact can be found in docker as $(IMAGE)."

# Build using locally installed dependencies and tools
build-local:
	@echo "Building using locally installed dependencies and tools..."
	bst build nekko-legacy.bst
	bst artifact checkout nekko-legacy.bst --tar dist/nekko-legacy-root.tar
	docker image import dist/nekko-legacy-root.tar $(IMAGE)
	@echo "Build complete.  The resulting artifacts can be found in the '$(DIST)' directory and in docker as $(IMAGE)."
