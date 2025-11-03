kind: cmake

build-depends:
- base/freedesktop-sdk.bst:public-stacks/buildsystem-python.bst
- base/freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst
- base/freedesktop-sdk.bst:components/patchelf.bst
- deps/protobuf-static.bst

depends:
- deps/date.bst
- deps/dlpack.bst
- deps/eigen.bst
- deps/safeint.bst
- deps/flatbuffers.bst
- deps/re2.bst
- deps/GSL.bst
- deps/pytorch-cpuinfo.bst
- deps/pybind.bst
- deps/onnx.bst
- deps/python3-numpy.bst
- legacy/et-trace-utils.bst
- legacy/glow.bst
- cuda/cuda-toolkit.bst

environment:
  LDFLAGS: ""
  CUDACXX: "/usr/local/cuda-13.0/bin/nvcc"

variables:
  conf-root: cmake
  (@):
  - include/_private/legacy-toolchain.yml
  cmake-local: >-
    -D CMAKE_INSTALL_RPATH="%{lib}"
    -D onnxruntime_ENABLE_PYTHON=on
    -D onnxruntime_USE_ETGLOW=on
    -D onnxruntime_USE_CUDA=on
    -D GFLAGS_USE_TARGET_NAMESPACE=gflags
    -D onnxruntime_BUILD_UNIT_TESTS=off
    -D onnxruntime_BUILD_SHARED_LIB=on
    -D onnxruntime_USE_FULL_PROTOBUF=on
    -D CMAKE_SHARED_LINKER_FLAGS_INIT="-Wl,-Bsymbolic-functions -Wl,-z,relro -Wl,-z,now -Wl,-z,noexecstack"
    -D CMAKE_MODULE_LINKER_FLAGS_INIT="-Wl,-Bsymbolic-functions -Wl,-z,relro -Wl,-z,now -Wl,-z,noexecstack"

# todo cover your eyes - this is the inverse of our approach to onnx...
# for patchelf - see https://github.com/microsoft/onnxruntime/issues/24911
config:
  install-commands:
  - |
    %{make-install}
  - |
    (cd %{build-dir} && python ../setup.py install --root=%{install-root} --prefix=%{prefix})
  - |
    patchelf --clear-execstack %{install-root}%{lib}/python*/site-packages/onnxruntime/capi/*.so
  - |
    patchelf --clear-execstack %{install-root}%{lib}/python*/site-packages/onnxruntime/capi/libonnxruntime.so.*
  - |
    patchelf --clear-execstack %{install-root}%{lib}/libonnxruntime.so.*

sources:
- kind: git_repo
  url: github:microsoft/onnxruntime
  track: v1.21.1
  ref: v1.21.1-0-g8f7cce3a49fdbdac96e0868b75b7d0159db7ac7f
- kind: patch_queue
  path: static/patches/onnxruntime
