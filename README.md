# nekko buildstream

[![](https://dcbadge.limes.pink/api/server/WNKvkefkUs?logoColor=f9a03f)](https://discord.gg/WNKvkefkUs) Please join us in the #system channel on that Discord server!

This repository contains a [Buildstream](https://buildstream.build/) definition for building the tooling to compile and run software
on [ET devices](https://github.com/aifoundry-org).

# Containers

We publish the following [pre-built containers](https://github.com/orgs/nekkoai/packages?visibility=public) available based upon these definitions:

## nekko-legacy

```
$ docker pull ghcr.io/nekkoai/nekko-legacy:latest
```
This container supports running ONNX Runtime models.  An example model known to work on ET accelerators is [llama3 8b](https://huggingface.co/rvs/llama3-8b-Instruct-kvc-AWQ-int4-onnx).  Please see [Example:ET accelerator inference](https://github.com/nekkoai/nekko-buildstream/wiki/Example:-ET-accelerator-with-Hugging-Face-model-and-ONNXRuntime) for more information.

## nekko-lerobot

```
$ docker pull ghcr.io/nekkoai/nekko-lerobot:latest
```

This container supports running a [lerobot demo on ET devices](https://github.com/aifoundry-org/ETARS).

## nekko-tools

```
$ docker pull ghcr.io/nekkoai/nekko-tools:latest
```

This container provides `et-powertop` and `dev_mngt_service` tooling for ET accelerators.  Please see [Example: ET accelerator device tooling](https://github.com/nekkoai/nekko-buildstream/wiki/Example:-ET-accelerator-device-tooling) for more information.

# Stacks
* [Nekko Legacy Stack](https://github.com/nekkoai/nekko-buildstream) - This repository, Buildstream definition - including `platform`, `toolchain`, and `legacy` (including `onnxruntime`)
* [Freedesktop SDK](https://gitlab.com/freedesktop-sdk/freedesktop-sdk) - base platform we are building on top of - currently based on the `25.08` stable branch

# Components
* [ET RISC-V GNU Toolchain](https://github.com/aifoundry-org/riscv-gnu-toolchain) - RISC-V toolchain for ET platform.
* [ET Platform](https://github.com/aifoundry-org/et-platform) - ET Accelerator Firmware and Runtime

# Tooling
* [Apache BuildStream, the software integration tool](https://buildstream.build/) - Composition tool to create distributions from Apache
* [Buildstream Plugins](https://github.com/apache/buildstream-plugins) - Plugins providing `cmake`, `autotools`, `git`, etc support
* [Buildstream Community Plugins](https://gitlab.com/BuildStream/buildstream-plugins-community) - Additional plugins providing `pyproject`, `git_repo`, etc support
* [bst-plugins-container](https://gitlab.com/BuildStream/bst-plugins-container) - Plugin providing `docker_image` functionality

## Building

The final result of a build is an OCI image that can be run with Docker, Podman or in Kubernetes.

The steps are:

1. Clone this repository
1. Ensure proper network connections and credentials access
1. Run the build

**WARNING:** This build cannot take place on an arm64/aarch64 device, unless you run the build in an emulated environment.
Given that there will be long compilations, that is not recommended. This is due to a bug in buildstream. 
See [this issue](https://github.com/apache/buildstream/issues/1833).

### Clone this repository

```sh
% git clone https://github.com/nekkoai/nekko-buildstream
```

### Run the build

You can build in one of two ways:

* In Docker with `docker build`
* Locally with installed tools

In all cases, you have the option to download the latest copy of the cached build and use it.
The cached build is in a separate image called `ghcr.io/nekkoai/nekko-buildstream-cache:latest`.

You can overwrite which one to use by setting the `CACHE_IMAGE` Makefile variable.

```sh
make build-docker CACHE_IMAGE=my-custom-cache-image:latest
```

If you set it to an empty string, no cache image will be used.

```sh
make build-docker CACHE_IMAGE=""
```

The cache directory will be stored locally, by default in `./tmp/casd-cache`.  You can change that by setting the `CASD_CACHE` Makefile variable.

```sh
make build-docker CASD_CACHE=/path/to/custom/cache
```

#### Build with Docker

```sh
make build-docker
```

Note that building in Docker using buildstream requires special privileges. To enable these privileges,
the build is performed in a dedicated docker builder called `nekko-builder`.
This builder is created automatically when you run `make build-docker` if it does not already exist.

#### Build locally

To build the image locally, you will need to:

1. install all of the dependencies locally
1. build
1. Export the resulting artifact as a Docker-compatible tarball
1. Import the resulting tarball into your local docker image cache

At a minimum, you will need `bubblewrap` as that is the sandboxing tech used by `Buildstream`.  You will need a few other host utilities - as an example for `freedesktop-sdk`, some of the sources are bundled with `lzip`.

```sh
% sudo apt-get install bubblewrap lzip
% python -m venv myenv
% source myenv/bin/activate
% pip install buildstream buildstream-plugins dulwich tomlkit
```

##### Ubuntu 24.04 apparmor note

Ubuntu 24.04's default `apparmor` profiles may cause `bubblewrap` to fail with `bwrap: loopback: Failed RTM_NEWADDR: Operation not permitted`.  (See [bwrap: operation not permitted](https://github.com/ocaml/opam/issues/5968) for some back and forth.)

```
$ sudo apt install apparmor-profiles
$ sudo ln -s /usr/share/apparmor/extra-profiles/bwrap-userns-restrict /etc/apparmor.d/
$ systemctl reload apparmor
```

##### Run the local build

```sh
% bst build nekko-legacy.bst
```

(N.B. Until we have a project caching server, your first set of builds are going to have to fetch a lot of dependencies.  Freedesktop SDK runs a caching server, so, Buildstream will fetch whatever artifacts it can from there ... but, you'll likely want to grab a coffee or tea depending upon your connectivity.)

Once building is complete, export the resulting artifact as a Docker-compatible tarball and import it into your local docker
image cache.

```sh
% bst artifact checkout nekko-legacy.bst --tar nekko-legacy-root.tar
```


```sh
% docker image import nekko-legacy-root.tar ghcr.io/nekkoai/nekko-legacy:latest
```

### Run Docker image

```sh
% docker run -it --rm --device=/dev/et0_mgmt --device=/dev/et0_ops --privileged -v `pwd`:/workspace ghcr.io/nekkoai/nekko-legacy:latest
```

#### Run Commands within container

```sh
bash-5.3# python3
Python 3.13.7 (main, Nov 10 2011, 15:00:00) [GCC 15.2.0] on linux
Type "help", "copyright", "credits" or "license" for more information.
>>> import onnxruntime
>>> print(onnxruntime.get_available_providers())
['EtGlowExecutionProvider', 'CPUExecutionProvider']
>>>
```
