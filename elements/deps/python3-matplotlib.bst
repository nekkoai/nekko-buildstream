kind: pyproject

build-depends:
- base/freedesktop-sdk.bst:public-stacks/buildsystem-python.bst
- base/freedesktop-sdk.bst:public-stacks/buildsystem-meson.bst
- deps/python3-meson-python.bst
- deps/pybind.bst
- deps/python3-pybind.bst
- deps/python3-patchelf.bst

depends:
- base/freedesktop-sdk.bst:components/python3.bst
- base/freedesktop-sdk.bst:components/freetype.bst
- deps/qhull.bst
- deps/python3-pyparsing.bst
- deps/python3-kiwisolver.bst
- deps/python3-cycler.bst
- deps/python3-pillow.bst

variables:
  build-args: "--no-isolation --wheel --outdir %{dist-dir} -Csetup-args='-Dsystem-freetype=true' -Csetup-args='-Dsystem-qhull=true'"

sources:
- kind: git_repo
  url: github:matplotlib/matplotlib
  track: main
  ref: v3.10.7-11-g9b61b471d0a5bcadbb68a35515e7598b9640c9bf
