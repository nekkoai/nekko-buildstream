kind: cmake

build-depends:
- base/freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst

variables:
  cmake-local: >-
    -D CMAKE_POSITION_INDEPENDENT_CODE=ON
    -D BUILD_SHARED_LIBS=ON
    -D BUILD_TESTING=OFF
    -D WITH_EXAMPLES=OFF

sources:
- kind: git_repo
  url: github:open-telemetry/opentelemetry-cpp
  track: main
  ref: 4193b21d26e6156626f5028f53b33d838c65ccd4
