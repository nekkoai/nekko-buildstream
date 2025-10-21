kind: cmake

build-depends:
- base/freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst
- deps/eigen.bst

depends:
- deps/tinyxml2.bst
- deps/tinyobjloader.bst
- deps/glfw.bst

variables:
  cmake-local: >-
    -D BUILD_SHARED_LIBS=ON
    -D USE_SYSTEM_PACKAGE=ON
    -D MUJOCO_BUILD_TESTS=OFF
    -D MUJOCO_BUILD_EXAMPLES=OFF
    -D MUJOCO_TEST_PYTHON_UTIL=OFF
    -D MUJOCO_SIMULATE_USE_SYSTEM_GLFW=ON

sources:
- kind: git_repo
  url: github:google-deepmind/mujoco
  track: main
  ref: 3.3.7-18-g36bed9a9da8cbd42a8dddd8ab3d586a51abedd7d
- kind: git_module
  path: third_party/lodepng
  url: github:lvandeve/lodepng
  ref: 344b4b442d0de0787a999724dd6569461a00c92c
- kind: git_module
  path: third_party/marchingcubecpp
  url: github:aparis69/MarchingCubeCpp
  ref: f03a1b3ec29b1d7d865691ca8aea4f1eb2c2873d
- kind: git_module
  path: third_party/qhull
  url: github:qhull/qhull
  ref: d1c2fc0caa5f644f3a0f220290d4a868c68ed4f6
- kind: git_module
  path: third_party/trianglemeshdistance
  url: github:InteractiveComputerGraphics/TriangleMeshDistance
  ref: 2cb643de1436e1ba8e2be49b07ec5491ac604457
- kind: git_module
  path: third_party/libccd
  url: github:danfis/libccd
  ref: 7931e764a19ef6b21b443376c699bbc9c6d4fba8
- kind: patch_queue
  path: static/patches/mujoco
