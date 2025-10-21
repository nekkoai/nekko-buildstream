kind: pip

build-depends:
- base/freedesktop-sdk.bst:public-stacks/buildsystem-python.bst

depends:
- base/freedesktop-sdk.bst:components/python3.bst
- deps/python3-numpy.bst
- deps/python3-scipy.bst
- deps/python3-opencv.bst
- deps/python3-numba.bst
- deps/python3-mujoco.bst

variables:
  pip-flags: |
    %{pip} install --no-build-isolation --no-deps --root=%{install-root} --prefix=%{prefix}

sources:
- kind: git_repo
  url: github:ARISE-Initiative/robosuite
  track: v1.4.0
  ref: v1.4.0-0-gfbee5844ff5632f5b5698e204ec5357ca50be0df
