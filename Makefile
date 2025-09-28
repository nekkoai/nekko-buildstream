.PHONY: build build-local build-docker help all

IMAGE ?= ghcr.io/nekkoai/nutcracker-legacy:latest
DIST  ?= dist

# Default target is help
all: help

# Show this help message
help:
	@echo "Available make targets:"
	@awk '/^#/{desc=$$0; next} /^[a-zA-Z0-9_-]+:([^=]|$$)/{gsub(/^# ?/, "", desc); printf "  %-20s %s\n", $$1, desc; desc=""}' $(MAKEFILE_LIST)

# Build using default method of build-docker
build: build-docker

# Build using Docker; your tailscale network must be up
build-docker:
	@echo "Building using Docker..."
	docker build -t $(IMAGE) .
	@echo "Build complete.  The resulting artifact can be found in docker as $(IMAGE)."

# Build using locally installed dependencies and tools; you must be connected to the tailscale network before running
build-local:
	@echo "Building using locally installed dependencies and tools..."
	bst build nutcracker-legacy.bst
	bst artifact checkout nutcracker-legacy.bst --tar dist/nut-root.tar
	docker image import dist/nut-root.tar $(IMAGE)
	@echo "Build complete.  The resulting artifacts can be found in the '$(DIST)' directory and in docker as $(IMAGE)."