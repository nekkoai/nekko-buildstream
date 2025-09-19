kind: cmake

build-depends:
- base/freedesktop-sdk.bst:sdk.bst
- device/riscv-toolchain.bst

depends:
- device/riscv-toolchain.bst

variables:
  command-subdir: device/etsoc_hal
  (@):
  - include/_private/device-toolchain.yml

# what to do about:
#RUN cd etsoc_hal && \
#    bunzip2 include/hwinc/dwc_pcie4_phy_x4_ns.h.bz2 include/hwinc/sp_spio_regbus.h.bz2
sources:
- kind: git
  url: github:nekkoai/nutcracker
  track: main
  ref: 0e72220972fdaebd4734f19d3ebfe6ad17d6fd16
