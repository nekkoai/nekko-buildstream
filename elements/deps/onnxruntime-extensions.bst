kind: pyproject

build-depends:
- base/freedesktop-sdk.bst:public-stacks/buildsystem-python.bst
- base/freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst
- base/freedesktop-sdk.bst:components/protobuf.bst
- base/freedesktop-sdk.bst:components/libpng.bst
- base/freedesktop-sdk.bst:components/jpeg.bst
- base/freedesktop-sdk.bst:components/zlib.bst
- deps/onnx.bst
- deps/re2.bst
- deps/dlib.bst
- deps/dr_libs.bst
- deps/sentencepiece.bst
- deps/nlohmann-json.bst
- deps/blingfire.bst
- deps/pybind.bst
- deps/onnxruntime.bst

depends:
- base/freedesktop-sdk.bst:components/protobuf.bst
- base/freedesktop-sdk.bst:components/libpng.bst
- base/freedesktop-sdk.bst:components/jpeg.bst
- base/freedesktop-sdk.bst:components/zlib.bst
- deps/onnx.bst
- deps/re2.bst
- deps/dlib.bst
- deps/dr_libs.bst
- deps/sentencepiece.bst
- deps/nlohmann-json.bst
- deps/blingfire.bst
- deps/pybind.bst
- deps/onnxruntime.bst

variables:
  build-args: "--no-isolation --wheel --outdir %{dist-dir} -C ortx-user-option=ort_pkg_dir=%{prefix}"
  (@):
  - include/_private/legacy-toolchain.yml

config:
  install-commands:
  - |
    %{python} -minstaller %{dist-dir}/*.whl --destdir %{install-root} --prefix %{prefix}
  - |
    (cd .scb/temp.*/ && env DESTDIR="%{install-root}" cmake --build . --target install)

sources:
- kind: git
  url: github:microsoft/onnxruntime-extensions
  track: main
  ref: 43387b1ce8c145442d8cfea8b99ba990ba5b96ea
- kind: patch
  path: static/patches/onnxruntime-extensions-cmake.patch
