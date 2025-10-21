kind: pyproject

build-depends:
- base/freedesktop-sdk.bst:public-stacks/buildsystem-python.bst
- base/freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst
- base/freedesktop-sdk.bst:public-stacks/buildsystem-autotools.bst
- deps/eigen.bst
- deps/pybind.bst

depends:
- base/freedesktop-sdk.bst:components/python3.bst
- base/freedesktop-sdk.bst:components/abseil-cpp.bst
- deps/python3-absl-py.bst
- deps/mujoco.bst
- deps/python3-glfw.bst

# TODO - we get errors when trying to strip the C libraries
variables:
  strip-binaries: ''
  command-subdir: python

environment:
  MUJOCO_PATH: "/usr"
  MUJOCO_PLUGIN_PATH: "../plugin"
  MUJOCO_CMAKE_ARGS: "-DMUJOCO_PYTHON_USE_SYSTEM_PYBIND11=ON -DMUJOCO_SIMULATE_USE_SYSTEM_MUJOCO=ON -DMUJOCO_SIMULATE_USE_SYSTEM_GLFW=ON"

config:
  build-commands:
    - | 
      ./make_source.sh
      %{python} -mbuild %{build-args} .

sources:
- kind: git_repo
  url: github:google-deepmind/mujoco
  track: main
  ref: 3.3.7-18-g36bed9a9da8cbd42a8dddd8ab3d586a51abedd7d
- kind: git_module
  path: python/mujoco/third_party/lodepng
  url: github:lvandeve/lodepng
  ref: 344b4b442d0de0787a999724dd6569461a00c92c
- kind: patch_queue
  path: static/patches/python3-mujoco
