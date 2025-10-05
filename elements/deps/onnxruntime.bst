kind: cmake

build-depends:
- base/freedesktop-sdk.bst:public-stacks/buildsystem-python.bst
- base/freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst
- base/freedesktop-sdk.bst:components/patchelf.bst

depends:
- base/freedesktop-sdk.bst:components/protobuf.bst
- base/freedesktop-sdk.bst:components/gflags.bst
- deps/boost.bst
- deps/nlohmann-json.bst
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
- deps/gtest.bst

variables:
  conf-root: cmake
  cmake-local: >-
    -D onnxruntime_ENABLE_PYTHON=on
    -D GFLAGS_USE_TARGET_NAMESPACE=gflags
    -D onnxruntime_BUILD_UNIT_TESTS=off
    -D onnxruntime_BUILD_SHARED_LIB=on
    -D onnxruntime_USE_FULL_PROTOBUF=on
    -D onnxruntime_DISABLE_RTTI=off
    -D onnxruntime_USE_VCPKG=on

# todo cover your eyes - this is the inverse of our approach to onnx...
# for patchelf - see https://github.com/microsoft/onnxruntime/issues/24911
config:
  install-commands:
  - |
    %{make-install}
  - |
    (cd %{build-dir} && python ../setup.py install --root=%{install-root} --prefix=%{prefix})
  - |
    patchelf --clear-execstack %{install-root}%{prefix}/lib/python*/site-packages/onnxruntime/capi/*.so

#  track: v1.19.2
#  ref: v1.19.2-0-gffceed9d44f2f3efb9dd69fa75fea51163c91d91
#-kind: patch
#  path: static/patches/onnxruntime-1192-upstream.patch

#- kind: git_repo
#  url: github:nekkoai/atlantis
#  track: master
#  ref: 7a9f893254e81974f9ba57411f17b166e2e4def2
#-kind: patch
#  path: static/patches/onnxruntime-cmake.patch

sources:
- kind: git_repo
  url: github:microsoft/onnxruntime
  track: v1.23.0
  ref: v1.23.0-0-gbe835efc56aca19b8e810538ec93c8e150e0fc61
- kind: patch_queue
  path: static/patches/onnxruntime-upstream
