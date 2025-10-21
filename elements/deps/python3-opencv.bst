kind: pyproject

build-depends:
- base/freedesktop-sdk.bst:public-stacks/buildsystem-python.bst
- deps/python3-scikit-build.bst

depends:
- base/freedesktop-sdk.bst:components/python3.bst
- deps/python3-numpy.bst

environment:
  SETUPTOOLS_SCM_PRETEND_VERSION: "4.13"
  OPENCV_PYTHON_SKIP_GIT_COMMANDS: "true"

sources:
- kind: git_repo
  url: github:opencv/opencv-python
  track: 4.x
  ref: 88-6-g4924e6b92990750fd106edb6836ac2b0fb977c03
- kind: git_module
  path: opencv
  url: github:opencv/opencv
  ref: 49486f61fb25722cbcf586b7f4320921d46fb38e
- kind: git_module
  path: opencv_contrib
  url: github:opencv/opencv_contrib
  ref: d943e1d61c8bc556a13783e1546ee7c1a9e0b1cf
- kind: git_module
  path: multibuild
  url: github:multi-build/multibuild
  ref: 0714f52ea1ea57a0bc33c7f8b74bae457e1fa8e0
- kind: git_module
  path: opencv_extra
  url: github:opencv/opencv_extra
  ref: b6db059e9b80072d80d009d2ab344f8606a8e964
- kind: patch
  path: static/patches/python3-opencv-build.patch
