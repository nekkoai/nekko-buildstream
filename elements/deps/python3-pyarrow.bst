kind: pyproject

build-depends:
- base/freedesktop-sdk.bst:public-stacks/buildsystem-python.bst
- base/freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst
- base/freedesktop-sdk.bst:public-stacks/buildsystem-autotools.bst
- base/freedesktop-sdk.bst:components/cython.bst

depends:
- base/freedesktop-sdk.bst:components/python3.bst
- deps/python3-numpy.bst
- deps/arrow.bst

variables:
  command-subdir: python

sources:
- kind: git_repo
  url: github:apache/arrow
  track: main
  ref: apache-arrow-22.0.0.dev-223-gfc5fd482f21bb51a8bd955fe6c46e8650e8105bd
