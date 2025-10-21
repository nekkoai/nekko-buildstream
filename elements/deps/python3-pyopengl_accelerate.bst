kind: pyproject

build-depends:
- base/freedesktop-sdk.bst:public-stacks/buildsystem-python.bst
- base/freedesktop-sdk.bst:components/cython.bst

depends:
- base/freedesktop-sdk.bst:components/python3.bst
- deps/python3-pyopengl.bst
- deps/python3-numpy.bst

variables:
  command-subdir: accelerate

sources:
- kind: git_repo
  url: github:mcfletch/pyopengl
  track: master
  ref: 3.1.10-0-gbca277036974e5ed9567b90c8176f8c09cd035ec
