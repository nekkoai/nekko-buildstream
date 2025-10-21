kind: pyproject

build-depends:
- base/freedesktop-sdk.bst:public-stacks/buildsystem-python-hatchling.bst
- base/freedesktop-sdk.bst:components/stripper.bst
- deps/python3-hatch-fancy-pypi-readme.bst

depends:
- base/freedesktop-sdk.bst:components/python3-installer.bst
- base/freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst
- deps/python3-distro.bst

sources:
- kind: git_repo
  url: github:scikit-build/scikit-build
  track: main
  ref: 0.18.1-9-ga2afff25f98e0d1fe573f520b659e1ee1f427c38
