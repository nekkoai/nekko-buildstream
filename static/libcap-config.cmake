set(libcap_FOUND TRUE)
if(NOT TARGET libcap::libcap)
  add_library(libcap::libcap SHARED IMPORTED)
  set_target_properties(libcap::libcap PROPERTIES
    IMPORTED_LOCATION "/usr/lib/x86_64-linux-gnu/libcap.so.2"
    INTERFACE_INCLUDE_DIRECTORIES "/usr/include")
endif()
