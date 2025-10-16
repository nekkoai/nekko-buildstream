kind: cmake

build-depends:
- base/freedesktop-sdk.bst:public-stacks/buildsystem-python.bst
- base/freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst
- deps/protobuf-static.bst

depends:
- base/freedesktop-sdk.bst:components/python3.bst
- base/freedesktop-sdk.bst:components/libpng.bst
- base/freedesktop-sdk.bst:components/jpeg.bst
- base/freedesktop-sdk.bst:components/zlib.bst
- deps/onnx.bst
- deps/pybind.bst
- deps/re2.bst
- deps/dlib.bst
- deps/dr_libs.bst
- deps/sentencepiece.bst
- deps/nlohmann-json.bst
- deps/blingfire.bst
- legacy/onnxruntime.bst

runtime-depends:
- deps/python3-onnx_ir.bst

variables:
  (@):
  - include/_private/legacy-toolchain.yml
  cmake-local: >-
    -D ENABLE_TESTS=off
    -D ENABLE_MODEL_BENCHMARK=OFF
    -D USE_CUDA=OFF
    -D USE_ROCM=OFF
    -D BUILD_WHEEL=on
    -D ORT_HOME=%{prefix}

environment:
  LDFLAGS: ""

config:
  install-commands:
  - |
    %{make-install}
  - |
    (cd %{build-dir}/wheel && python setup.py install --root=%{install-root} --prefix=%{prefix})

# v0.8.3 is last one compatible with onnxruntime 1.21 ; when we upgrade, we can pick newer versions
sources:
- kind: git_repo
  url: github:microsoft/onnxruntime-genai
  track: v0.8.3
  ref: v0.8.3-0-gdc2d850790a61efcf7b5098144df90344ad19d6e
- kind: git_module
  path: onnxruntime-extensions
  url: github:microsoft/onnxruntime-extensions
  ref: 41b89b1016eddb5ca45a686883b621872958870c
#track: main
#bd8fb6d86e98c17e397c42fc001913cc2e035597
- kind: patch_queue
  path: static/patches/onnxruntime-genai
