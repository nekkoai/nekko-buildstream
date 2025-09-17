kind: cmake

# todo n.b. patchelf needs our override for --clear-execstack as defined in base junction
build-depends:
- base/freedesktop-sdk.bst:sdk.bst
- base/freedesktop-sdk.bst:public-stacks/buildsystem-python-setuptools.bst
- base/freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst
- base/freedesktop-sdk.bst:components/patchelf.bst
- deps/date.bst
- deps/nsync.bst
- deps/eigen.bst
- deps/safeint.bst
- deps/flatbuffers.bst
- deps/re2.bst
- deps/GSL.bst
- deps/pytorch-cpuinfo.bst
- deps/pybind.bst
- deps/python3-numpy.bst
- deps/onnx.bst
- legacy/et-trace-utils.bst
- legacy/glow.bst

depends:
- base/freedesktop-sdk.bst:components/protobuf.bst 
- deps/date.bst
- deps/nsync.bst
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

variables:
  command-subdir: onnx/onnxruntime
  conf-root: cmake
  (@):
  - include/_private/legacy-toolchain.yml
  cmake-local: >-
    -D CMAKE_INSTALL_RPATH="%{lib}"
    -D onnxruntime_ENABLE_PYTHON=on
    -D onnxruntime_USE_ETGLOW=on
    -D GFLAGS_USE_TARGET_NAMESPACE=gflags
    -D onnxruntime_BUILD_UNIT_TESTS=off
    -D onnxruntime_BUILD_SHARED_LIB=on
    -D onnxruntime_USE_PREINSTALLED_EIGEN=on

# todo cover your eyes - this is the inverse of our approach to onnx...
config:
  install-commands:
  - |
    %{make-install}
  - |
    (cd %{build-dir} && python ../setup.py install --root=%{install-root} --prefix=%{prefix})

# todo - cleaner way to get python version rather than globbing? 
# see https://github.com/microsoft/onnxruntime/issues/24911
#public:
#  bst:
#    integration-commands:
#    - patchelf --clear-execstack "%{lib}/python*/site-packages/onnxruntime/capi/*.so"

sources:
- kind: git_repo
  url: github:nekkoai/atlantis
  track: master
  ref: 7a9f893254e81974f9ba57411f17b166e2e4def2
- kind: patch
  path: static/patches/onnxruntime-cmake.patch
