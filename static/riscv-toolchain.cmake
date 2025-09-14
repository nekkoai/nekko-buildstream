# This toolchain file configures CMake for RISC-V cross-compilation targeting
# the ETSoC-1 hardware platform with baremetal environment.

set(CMAKE_SYSTEM_NAME Generic)
set(CMAKE_SYSTEM_PROCESSOR riscv64)

# Set the toolchain root from environment variable
if(DEFINED ENV{TOOLCHAIN_ROOT})
    set(TOOLCHAIN_ROOT $ENV{TOOLCHAIN_ROOT})
else()
    set(TOOLCHAIN_ROOT /opt/toolchain/gnu)
endif()

# Set compilers
set(CMAKE_C_COMPILER ${TOOLCHAIN_ROOT}/bin/riscv64-unknown-elf-gcc)
set(CMAKE_CXX_COMPILER ${TOOLCHAIN_ROOT}/bin/riscv64-unknown-elf-g++)
set(CMAKE_ASM_COMPILER ${TOOLCHAIN_ROOT}/bin/riscv64-unknown-elf-gcc)
set(CMAKE_AR ${TOOLCHAIN_ROOT}/bin/riscv64-unknown-elf-ar)
set(CMAKE_RANLIB ${TOOLCHAIN_ROOT}/bin/riscv64-unknown-elf-ranlib)
set(CMAKE_STRIP ${TOOLCHAIN_ROOT}/bin/riscv64-unknown-elf-strip)
set(CMAKE_OBJCOPY ${TOOLCHAIN_ROOT}/bin/riscv64-unknown-elf-objcopy)
set(CMAKE_OBJDUMP ${TOOLCHAIN_ROOT}/bin/riscv64-unknown-elf-objdump)
set(CMAKE_LINKER ${TOOLCHAIN_ROOT}/bin/riscv64-unknown-elf-ld)

# Compiler flags for ETSoC-1 cross-compilation
# These flags combine RISC-V ISA settings, baremetal requirements, and warning suppressions
set(CMAKE_C_FLAGS "-march=rv64imf -mabi=lp64f -mcmodel=medany -fno-zero-initialized-in-bss -ffunction-sections -fdata-sections -I/opt/nekko/device/include -Wno-error=unused-parameter -Wno-error=maybe-uninitialized -Wno-error=strict-aliasing" CACHE STRING "")
set(CMAKE_CXX_FLAGS "-march=rv64imf -mabi=lp64f -mcmodel=medany -fno-zero-initialized-in-bss -ffunction-sections -fdata-sections -I/opt/nekko/device/include -Wno-error=unused-parameter -Wno-error=maybe-uninitialized -Wno-error=strict-aliasing" CACHE STRING "")
set(CMAKE_ASM_FLAGS "-march=rv64imf -mabi=lp64f -mcmodel=medany" CACHE STRING "")

# Set C and C++ standards
set(CMAKE_C_STANDARD 11)
set(CMAKE_CXX_STANDARD 17)

# Don't run the linker on compiler check
set(CMAKE_TRY_COMPILE_TARGET_TYPE STATIC_LIBRARY)

# Search paths configuration for cross-compilation
set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
