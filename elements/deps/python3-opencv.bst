kind: pyproject

build-depends:
- base/freedesktop-sdk.bst:public-stacks/buildsystem-python.bst
- deps/python3-scikit-build.bst
- deps/protobuf-static.bst

runtime-depends:
- base/freedesktop-sdk.bst:components/abseil-cpp.bst

depends:
- base/freedesktop-sdk.bst:components/python3.bst
- base/freedesktop-sdk.bst:components/libpng.bst
- base/freedesktop-sdk.bst:components/libavif.bst
- base/freedesktop-sdk.bst:components/libtiff.bst
- base/freedesktop-sdk.bst:components/giflib.bst
- base/freedesktop-sdk.bst:components/jpeg.bst
- base/freedesktop-sdk.bst:components/openjpeg.bst
- base/freedesktop-sdk.bst:components/gtk3.bst
- base/freedesktop-sdk.bst:components/ffmpeg.bst
- base/freedesktop-sdk.bst:components/gstreamer.bst
- base/freedesktop-sdk.bst:components/gstreamer-plugins-base.bst
- base/freedesktop-sdk.bst:components/gstreamer-plugins-good.bst
- base/freedesktop-sdk.bst:components/gstreamer-plugins-bad.bst
- base/freedesktop-sdk.bst:components/gstreamer-plugins-ugly.bst
- base/freedesktop-sdk.bst:components/gstreamer-plugins-rs.bst
- deps/python3-numpy.bst
- deps/openblas.bst
- deps/eigen.bst
- deps/flatbuffers.bst

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
  ref: 09c893477e2b4231948dc8ff616fa49b39538730
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
