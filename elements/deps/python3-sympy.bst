kind: pip

build-depends:
- base/freedesktop-sdk.bst:public-stacks/buildsystem-python.bst
- deps/python3-mpmath.bst

depends:
- base/freedesktop-sdk.bst:components/python3.bst
- deps/python3-mpmath.bst

variables:
  pip-flags: |
    %{pip} install --no-build-isolation --no-deps --root=%{install-root} --prefix=%{prefix}

sources:
- kind: git
  url: github:sympy/sympy
  track: 1.14
  ref: 16fa855354eb7bcabd3fe10993841e03b1382692
