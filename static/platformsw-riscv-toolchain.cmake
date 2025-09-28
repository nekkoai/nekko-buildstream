if (DEFINED ENV{TOOLCHAIN_DIR})
    set(TOOLCHAIN_DIR $ENV{TOOLCHAIN_ROOT})
else()
    set(TOOLCHAIN_DIR /opt/toolchain/gnu)
endif()

set(CMAKE_SYSTEM_NAME Generic)
set(CMAKE_SYSTEM_PROCESSOR riscv64)

set(TARGET_TRIPLE riscv64-unknown-elf)

set(CMAKE_C_COMPILER "${TOOLCHAIN_DIR}/bin/riscv64-unknown-elf-gcc")
set(CMAKE_CXX_COMPILER "${TOOLCHAIN_DIR}/bin/riscv64-unknown-elf-g++")
set(CMAKE_ASM_COMPILER "${TOOLCHAIN_DIR}/bin/riscv64-unknown-elf-gcc")
set(CMAKE_LINKER "${TOOLCHAIN_DIR}/bin/riscv64-unknown-elf-ld")
set(CMAKE_AR "${TOOLCHAIN_DIR}/bin/riscv64-unknown-elf-ar")
set(CMAKE_RANLIB "${TOOLCHAIN_DIR}/bin/riscv64-unknown-elf-ranlib")
set(CMAKE_STRIP "${TOOLCHAIN_DIR}/bin/riscv64-unknown-elf-strip")
set(CMAKE_NM "${TOOLCHAIN_DIR}/bin/riscv64-unknown-elf-nm")
set(CMAKE_OBJDUMP "${TOOLCHAIN_DIR}/bin/riscv64-unknown-elf-objdump")
set(CMAKE_OBJCOPY "${TOOLCHAIN_DIR}/bin/riscv64-unknown-elf-objcopy")
set(CMAKE_SIZE "${TOOLCHAIN_DIR}/bin/riscv64-unknown-elf-size")
set(CMAKE_READELF "${TOOLCHAIN_DIR}/bin/riscv64-unknown-elf-readelf")

set(CMAKE_C_COMPILER_TARGET ${TARGET_TRIPLE})
set(CMAKE_CXX_COMPILER_TARGET ${TARGET_TRIPLE})
set(CMAKE_ASM_COMPILER_TARGET ${TARGET_TRIPLE})

set(CMAKE_C_FLAGS_DEBUG_INIT          "-O0 -g3" CACHE STRING "c flags" FORCE)
set(CMAKE_C_FLAGS_RELEASE_INIT        "-O3"     CACHE STRING "c flags" FORCE)
set(CMAKE_C_FLAGS_MINSIZEREL_INIT     "-Os"     CACHE STRING "c flags" FORCE)
set(CMAKE_C_FLAGS_RELWITHDEBINFO_INIT "-O2 -g"  CACHE STRING "c flags" FORCE)

set(CMAKE_C_FLAGS_INIT "--specs=nano.specs -mcmodel=medany -march=rv64imfc -mabi=lp64f -mno-strict-align -mno-riscv-attribute \
                        -fstack-usage -Wall -Wextra \
                        -Wdouble-promotion -Wformat -Wnull-dereference -Wswitch-enum -Wshadow -Wstack-protector \
                        -Wpointer-arith -Wundef -Wbad-function-cast -Wcast-qual -Wcast-align -Wconversion -Wlogical-op \
                        -Wstrict-prototypes -Wmissing-prototypes -Wmissing-declarations -Wno-main" CACHE STRING "c flags" FORCE)

set(CMAKE_CXX_FLAGS_DEBUG_INIT          "-O0 -g3" CACHE STRING "cxx flags" FORCE)
set(CMAKE_CXX_FLAGS_RELEASE_INIT        "-O3"     CACHE STRING "cxx flags" FORCE)
set(CMAKE_CXX_FLAGS_MINSIZEREL_INIT     "-Os"     CACHE STRING "cxx flags" FORCE)
set(CMAKE_CXX_FLAGS_RELWITHDEBINFO_INIT "-O2 -g"  CACHE STRING "cxx flags" FORCE)

set(CMAKE_CXX_FLAGS_INIT "--specs=nano.specs -mcmodel=medany -march=rv64imfc -mabi=lp64f  -mno-strict-align -mno-riscv-attribute \
                        -fstack-usage -Wall -Wextra \
                        -Wdouble-promotion -Wformat -Wnull-dereference -Wswitch-enum -Wshadow -Wstack-protector \
                        -Wpointer-arith -Wundef -Wcast-qual -Wcast-align -Wconversion -Wlogical-op \
                        -Wmissing-declarations -Wno-main" CACHE STRING "cxx flags" FORCE)


set(CMAKE_ASM_FLAGS_INIT "-D_ASSEMBLER")

set(CMAKE_C_COMPILER_WORKS 1)
set(CMAKE_CXX_COMPILER_WORKS 1)
set(CMAKE_ASM_COMPILER_WORKS 1)
