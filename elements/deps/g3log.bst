kind: cmake

build-depends:
- base/freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst

# TODO Requires Release build
variables:
  cmake-local: >-
    -D USE_DYNAMIC_LOGGING_LEVELS=on
    -D ADD_G3LOG_UNIT_TEST=off
    -D CMAKE_POSITION_INDEPENDENT_CODE=on
    -D CMAKE_POLICY_VERSION_MINIMUM=3.5
    -D CMAKE_BUILD_TYPE=Release
      
sources:
- kind: git_repo
  url: github:KjellKod/g3log
  track: master
  ref: 38dbddc7071666ef6cc02f24ff30a8773ee4222f
