kind: import

sources:
- kind: tar
  url: nvidia:cuda_nvcc/linux-x86_64/cuda_nvcc-linux-x86_64-13.0.88-archive.tar.xz
  ref: 48e35be3cfbf4b4fbc16828eaec8a7048ee789403049dc409f7b643d6259cf7a
- kind: tar
  url: nvidia:cuda_cudart/linux-x86_64/cuda_cudart-linux-x86_64-13.0.96-archive.tar.xz
  ref: 25b8071951baba827be1580b841d363464f6ee6c39f48d33a81646f90cc95ed1
- kind: tar
  url: nvidia:cuda_crt/linux-x86_64/cuda_crt-linux-x86_64-13.0.88-archive.tar.xz
  ref: 5a3279a049ffc1cdb951c44cb95206acfdde9e9ae5e87825fc18d7e4a6878bb0
- kind: tar
  url: nvidia:nvidia_driver/linux-x86_64/nvidia_driver-linux-x86_64-580.95.05-archive.tar.xz
  ref: 3528df4fb0c7a1665ae2af5d26effeb67f76fc86742ffc1defd7714408405d4d
- kind: tar
  url: nvidia:libcublas/linux-x86_64/libcublas-linux-x86_64-13.1.0.3-archive.tar.xz
  ref: 88bc951efd906032a371153ca61975e0d9c4761e4012169169a6b3a47931606e
- kind: tar
  url: nvidia:libcusparse/linux-x86_64/libcusparse-linux-x86_64-12.6.3.3-archive.tar.xz
  ref: b9de356c3478329e2589d91284f2a685a36f041060f3cb897441ab46a480a30a
- kind: tar
  url: nvidia:libcufile/linux-x86_64/libcufile-linux-x86_64-1.15.1.6-archive.tar.xz
  ref: 2c1f544ab1b0e215590d943cbd1b0a192a066e9b7592e605c2e28b22e886688f
- kind: tar
  url: nvidia:libcurand/linux-x86_64/libcurand-linux-x86_64-10.4.0.35-archive.tar.xz
  ref: ee0dbf473998050bda876cb945634bec87d44b90b05a5550e9c2499ab7c1a5c3
- kind: tar
  url: nvidia:libcufft/linux-x86_64/libcufft-linux-x86_64-12.0.0.61-archive.tar.xz
  ref: 5cdef1238c270f8f148da18587fdba8b9478c596e40f5490bba2b15c94915dd9
- kind: tar
  url: nvidia:cuda_nvrtc/linux-x86_64/cuda_nvrtc-linux-x86_64-13.0.88-archive.tar.xz
  ref: 00038aac08e1dba6f1933237dbfb217ac6452ae24fab970edcac808f103ca64b
- kind: tar
  url: nvidia:cuda_culibos/linux-x86_64/cuda_culibos-linux-x86_64-13.0.85-archive.tar.xz
  ref: 98fca11f9ab89be61385a67eee686c1ebf76fad9c7269d0cf9090edfcdb8a8ac
- kind: tar
  url: nvidia-cudnn:cudnn/linux-x86_64/cudnn-linux-x86_64-9.14.0.64_cuda13-archive.tar.xz
  ref: 75b8c5feb7e65107dc8881af2cf245f9be77274f607c019a966347e36d1526e7
config:
  target: /usr/local/cuda-13.0
