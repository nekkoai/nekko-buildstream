.PHONY: build build-local build-docker help all

# image that is built; can be overridden by running `make IMAGE=your-image:tag build`
IMAGE ?= ghcr.io/nekkoai/nutcracker-legacy:latest
DIST  ?= dist

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

ifdef CI
BUILD_FLAGS=--secret id=git_credentials,src=$(HOME)/.git-credentials \
              --secret id=git_config,src=$(HOME)/.gitconfig \
              --secret id=github_token_nekkoai,env=GITHUB_TOKEN
BUILD_ARGS=--build-arg USE_SSH=false
else
BUILD_FLAGS=--ssh default --secret id=github_token_nekkoai,env=GITHUB_TOKEN
endif


# Build using Docker; note that it *only* builds for linux/amd64 due to a buildstream bug; see the README.md. This is meant for running manually.
build-docker:
	@echo "Building using Docker..."
	docker build --platform linux/amd64 $(BUILD_FLAGS) -t $(IMAGE) .
	@echo "Build complete.  The resulting artifact can be found in docker as $(IMAGE)."

# Build using locally installed dependencies and tools
build-local:
	@echo "Building using locally installed dependencies and tools..."
	bst build nutcracker-legacy.bst
	bst artifact checkout nutcracker-legacy.bst --tar dist/nut-root.tar
	docker image import dist/nut-root.tar $(IMAGE)
	@echo "Build complete.  The resulting artifacts can be found in the '$(DIST)' directory and in docker as $(IMAGE)."