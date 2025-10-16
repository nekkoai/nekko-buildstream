kind: cmake

build-depends:
- base/freedesktop-sdk.bst:public-stacks/buildsystem-python.bst
- base/freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst
- base/freedesktop-sdk.bst:public-stacks/buildsystem-autotools.bst

depends:
- base/freedesktop-sdk.bst:components/openssl.bst
- base/freedesktop-sdk.bst:components/protobuf.bst
- deps/boost.bst
- deps/xsimd.bst
- deps/re2.bst
- deps/utf8proc.bst
- deps/rapidjson.bst
- deps/thrift.bst
- deps/snappy.bst

# TODO: Get these options working if necessary
#    -D ARROW_MIMALLOC=ON
#    -D ARROW_SUBSTRAIT=ON
variables:
  command-subdir: cpp
  cmake-local: >-
    -D ARROW_DEPENDENCY_SOURCE=SYSTEM
    -D ARROW_MIMALLOC=OFF
    -D ARROW_COMPUTE=ON
    -D ARROW_CSV=ON
    -D ARROW_JSON=ON
    -D ARROW_FILESYSTEM=ON
    -D ARROW_PARQUET=ON
    -D ARROW_ACERO=ON
    -D ARROW_DATASET=ON
    -D ARROW_WITH_SNAPPY=ON

sources:
- kind: git_repo
  url: github:apache/arrow
  track: main
  ref: apache-arrow-22.0.0.dev-223-gfc5fd482f21bb51a8bd955fe6c46e8650e8105bd
