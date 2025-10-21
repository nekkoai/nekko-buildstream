kind: cmake

build-depends:
- base/freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst

runtime-depends:
- base/freedesktop-sdk.bst:extensions/mesa/mesa.bst

depends:
- base/freedesktop-sdk.bst:components/wayland.bst
- base/freedesktop-sdk.bst:components/libxkbcommon.bst
- base/freedesktop-sdk.bst:components/xorg-lib-xrandr.bst
- base/freedesktop-sdk.bst:components/xorg-lib-xinerama.bst
- base/freedesktop-sdk.bst:components/xorg-lib-xcursor.bst
- base/freedesktop-sdk.bst:components/xorg-lib-xi.bst
- base/freedesktop-sdk.bst:components/libglvnd.bst
- base/freedesktop-sdk.bst:components/mesa-headers.bst

variables:
  cmake-local: >-
    -D CMAKE_POSITION_INDEPENDENT_CODE=ON
    -D BUILD_SHARED_LIBS=ON
    -D GLFW_BUILD_EXAMPLES=OFF
    -D GLFW_BUILD_TESTS=OFF
    -D GLFW_BUILD_DOCS=OFF

sources:
- kind: git_repo
  url: github:glfw/glfw
  track: master
  ref: 3.4-53-g8e15281d34a8b9ee9271ccce38177a3d812456f8
