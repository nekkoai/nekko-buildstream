# nutcracker

This repository contains a Buildstream definition for building the tooling necessary to compile and run onnx format models
on etsoc devices.

# Stacks
* [Nutcracker Legacy Stack](https://github.com/nekkoai/nutcracker-buildstream) - This repository, Buildstream definition of nutcracker distribution - including `host`, `device`, and `legacy` (including `onnxruntime`)
* [Nutcracker](https://github.com/nekkoai/nutcracker) - Original Dockerfile implementation for nutcracker `host` and `device`
* [Freedesktop SDK](https://gitlab.com/freedesktop-sdk/freedesktop-sdk) - base platform we are building on top of from GNOME team - currently tagged to `25.08` release.

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
% git clone ssh://git@github.com/nekkoai/nutcracker-legacy
# OR
% git clone https://github.com/nekkoai/nutcracker-legacy
```

### Ensure proper network access and credentials

Until `github.com/nekkoai` repositories are public, you must use authenticated access to the private repositories.

The simplest way to do that is via ssh. Although it is possible to use https with a personal access token, we do not
support that currently in this build.

Test access:

```sh
% ssh -T git@github.com
Hi jerenkrantz! You've successfully authenticated, but GitHub does not provide shell access.
```

(Additionally, git LFS seems broken with atlantis ; but dulwich seems okay handling it...so we have to use `git_repo` source for now.)

Some of the artifacts are not reproducible, and sit on a ghcr.io in a private OCI image `ghcr.io/nekkoai/et-gnu-toolchain`.
For buildstream to access the OCI image, you need to have access to the `nekkoai` private repositories.

### Run the build

You can build in one of two ways:

* In Docker with `docker build`
* Locally with installed tools

#### Build with Docker

```sh
make build-docker
```

The docker build depends on access to private repositories. As such, it needs credentials to access those repositories.
The `make build-docker` command assumes you already have access to the `nekkoai` private repositories, and thus
mounts your git credentials into the docker build.

The following must be set up in advance of running the `make build-docker` command:

* `~/.git-credentials` - containing your https credentials for github.com, with access to private repositories in both github.com/nekkoai and github.com/aifoundry-org
* `~/.gitconfig` - containing gitconfig settings

Note that building in Docker using buildstream requires special privileges. To enable these privileges,
the build is performed in a dedicated docker builder called `nutcracker-builder`.
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
% bst build nutcracker-legacy.bst
```

(N.B. Until we have a project caching server, your first set of builds are going to have to fetch a lot of dependencies.  Freedesktop SDK runs a caching server, so, Buildstream will fetch whatever artifacts it can from there ... but, you'll likely want to grab a coffee or tea depending upon your connectivity.)

Once building is complete, export the resulting artifact as a Docker-compatible tarball and import it into your local docker
image cache.

```sh
% bst artifact checkout nutcracker-legacy.bst --tar nut-root.tar
```


```sh
% docker image import nut-root.tar ghcr.io/nekkoai/nutcracker-legacy:latest
```

### Run Docker image

```sh
% docker run -it --rm --device=/dev/et0_mgmt --device=/dev/et0_ops --privileged -v /home/justin:/home/justin -v /home/justin/workspace:/workspace ghcr.io/nekkoai/nutcracker-legacy:latest
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