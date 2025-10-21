kind: pip

build-depends:
- base/freedesktop-sdk.bst:public-stacks/buildsystem-python.bst

depends:
- base/freedesktop-sdk.bst:components/python3.bst

variables:
  pip-flags: |
    %{pip} install --no-build-isolation --no-deps --root=%{install-root} --prefix=%{prefix}

sources:
- kind: git_repo
  url: github:makinacorpus/easydict
  track: master
  ref: 1.13-0-g6df258e9bbeb2414bcb747b1691a6fbf5dfb7769
