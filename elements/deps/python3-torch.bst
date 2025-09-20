kind: pyproject

build-depends:
- base/freedesktop-sdk.bst:public-stacks/buildsystem-python.bst
- base/freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst
- base/freedesktop-sdk.bst:components/fmtlib.bst
- base/freedesktop-sdk.bst:components/ninja.bst
- base/freedesktop-sdk.bst:components/protobuf.bst
- base/freedesktop-sdk.bst:components/python3-requests.bst
- base/freedesktop-sdk.bst:components/python3-pyyaml.bst
- base/freedesktop-sdk.bst:components/python3-protobuf.bst
- deps/python3-numpy.bst
- deps/python3-astunparse.bst
- deps/python3-six.bst
- deps/python3-pybind.bst
- deps/eigen.bst
- deps/openblas.bst
- deps/pocketfft.bst
- deps/xnnpack.bst
- deps/psimd.bst
- deps/fp16.bst
- deps/pybind.bst
- deps/onnx.bst
- deps/sleef.bst
- deps/opentelemetry-cpp.bst
- deps/nlohmann-json.bst

depends:
- base/freedesktop-sdk.bst:components/python3.bst

environment:
  USE_SYSTEM_LIBS: 1
  USE_CUDA: OFF
  USE_NNPACK: OFF
  USE_TENSORPIPE: OFF
  USE_DISTRIBUTED: OFF
  USE_GLOO: OFF
  USE_KINETO: OFF
  USE_FBGEMM: OFF
  BUILD_TEST: OFF
  BUILD_SHARED_LIBS: ON

sources:
- kind: git_repo
  url: github:pytorch/pytorch
  #submodules:
  #  third_party/cutlass:
  #    url: github:NVIDIA/cutlass
  #    checkout: True
  track: release/2.8
  ref: ba56102387ef21a3b04b357e5b183d48f0afefc7
