kind: cmake

build-depends:
- base/freedesktop-sdk.bst:public-stacks/buildsystem-python.bst
- base/freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst

depends:
- base/freedesktop-sdk.bst:components/python3.bst
- deps/onnx.bst
- deps/pybind.bst
- legacy/onnxruntime.bst
- legacy/onnxruntime-extensions.bst

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
    -D ORTX_HOME=%{prefix}

environment:
  LDFLAGS: ""

config:
  install-commands:
  - |
    %{make-install}
  - |
    (cd %{build-dir}/wheel && python setup.py install --root=%{install-root} --prefix=%{prefix})
  
# v0.9.0 is last one compatible with onnxruntime 1.21 ; when we upgrade, we can pick newer versions
sources:
- kind: git
  url: github:microsoft/onnxruntime-genai
  track: v0.9.0
  ref: 5ba9fce5b52452a82b12ac343d941765c430d996
- kind: patch
  path: static/patches/onnxruntime-genai-09x.patch
