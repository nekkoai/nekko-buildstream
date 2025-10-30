kind: pip

build-depends:
- base/freedesktop-sdk.bst:public-stacks/buildsystem-python.bst

depends:
- base/freedesktop-sdk.bst:components/python3.bst
- deps/python3-numpy.bst
- deps/python3-torch.bst

runtime-depends:
- base/freedesktop-sdk.bst:components/llvm.bst

variables:
  (@):
  - include/_private/inference-toolchain.yml
  pip-flags: |
    %{pip} install --no-build-isolation --no-deps --root=%{install-root} --prefix=%{prefix}

sources:
- kind: git_repo
  url: github:tinygrad/tinygrad
  track: master
  ref: v0.11.0-982-g5eb87ab131375bb6053c8706451d1cc5c9f4116c
