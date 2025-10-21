kind: pip

build-depends:
- base/freedesktop-sdk.bst:public-stacks/buildsystem-python.bst

depends:
- base/freedesktop-sdk.bst:components/python3.bst
- deps/python3-robosuite.bst

variables:
  pip-flags: |
    %{pip} install --no-build-isolation --no-deps --root=%{install-root} --prefix=%{prefix}

sources:
- kind: git_repo
  url: github:ARISE-Initiative/robosuite_models
  track: main
  ref: 2d63a6b4319bda772420daf10594ce0de5bd793d
