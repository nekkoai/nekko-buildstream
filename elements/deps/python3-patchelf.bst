kind: pyproject

build-depends:
- base/freedesktop-sdk.bst:public-stacks/buildsystem-python-setuptools.bst
- base/freedesktop-sdk.bst:public-stacks/buildsystem-python-hatchling.bst
- base/freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst
- base/freedesktop-sdk.bst:public-stacks/buildsystem-autotools.bst
- base/freedesktop-sdk.bst:components/ninja.bst
- deps/python3-scikit-build-core.bst

depends:
- deps/python3-scikit-build-core.bst

# TODO figure out how to get this dynamically?  guess_version??
environment:
  SETUPTOOLS_SCM_PRETEND_VERSION: "0.17.2.3"

sources:
- kind: git_repo
  url: github:mayeut/patchelf-pypi
  track: main
  ref: v0.17.2.3-15-g075e676ff19596889139dfb3d962df476ef1f399
- kind: git_module
  path: src/patchelf-upstream
  url: github:NixOS/patchelf
  ref: 5908e16cd562bcb1909be4de0409c4912a8afc52
