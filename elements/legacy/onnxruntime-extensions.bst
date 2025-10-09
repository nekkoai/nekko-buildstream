kind: pyproject

build-depends:
- base/freedesktop-sdk.bst:public-stacks/buildsystem-python.bst
- base/freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst
- legacy/python3-site-nekko.bst

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
- legacy/onnxruntime.bst

variables:
  build-args: "--no-isolation --wheel --outdir %{dist-dir} -C ortx-user-option=ort_pkg_dir=%{prefix},pp-api"
  (@):
  - include/_private/legacy-toolchain.yml

environment:
  CMAKE_MODULE_PATH: "%{cmake_module_path}"
  CMAKE_PREFIX_PATH: "%{prefix};/opt/nekko/platform;/opt/toolchain/llvm"
  CMAKE_GENERATOR: "Ninja"
  CMAKE_ARGS: "-DCMAKE_INSTALL_LIBDIR:PATH=%{lib}"
  LDFLAGS: ""

config:
  install-commands:
  - |
    %{python} -minstaller %{dist-dir}/*.whl --destdir %{install-root} --prefix %{prefix}
  - |
    (cd .scb/temp.*/ && env DESTDIR="%{install-root}" cmake --build . --target install)

# onnxruntime-genai is not yet compatible with main as of Oct 2025
# Use version pinned in https://github.com/microsoft/onnxruntime-genai/blob/main/cmake/deps.txt
sources:
- kind: git
  url: github:microsoft/onnxruntime-extensions
  track: main
  ref: bd8fb6d86e98c17e397c42fc001913cc2e035597
- kind: patch
  path: static/patches/onnxruntime-extensions-cmake.patch
