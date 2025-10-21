kind: pyproject

build-depends:
- base/freedesktop-sdk.bst:public-stacks/buildsystem-python.bst
- base/freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst
- base/freedesktop-sdk.bst:public-stacks/buildsystem-autotools.bst
- deps/python3-scikit-build-core.bst

depends:
- base/freedesktop-sdk.bst:components/python3.bst

environment:
  CMAKE_ARGS: "-DBUILD_CMAKE_FROM_SOURCE:BOOL=OFF -DCMakePythonDistributions_SUPERBUILD=0"

sources:
- kind: git_repo
  url: github:scikit-build/cmake-python-distributions
  track: main
  ref: 4.1.0-14-g007c218741a1f7d29ff33bc76af7d8b474c34a35
