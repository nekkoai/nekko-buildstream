kind: pip

build-depends:
- base/freedesktop-sdk.bst:public-stacks/buildsystem-python.bst

depends:
- base/freedesktop-sdk.bst:components/python3.bst
- deps/python3-llvmlite.bst
- deps/python3-numpy.bst

variables:
  pip-flags: |
    %{pip} install --no-build-isolation --no-deps --root=%{install-root} --prefix=%{prefix}

sources:
- kind: git_repo
  url: github:numba/numba
  track: main
  ref: 0.63.0b1-4-g4c37ce138ef7ecbf04474cc706885a6d4312b279
