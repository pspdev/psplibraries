#!/bin/sh
# check-cmake-toolchain-script.sh by Takeshi Watanabe (takechi101010@gmail.com)

 ## Check for cmake toolchain script.
 ls \
     $(psp-config --pspdev-path)/bin/psp-cmake \
     $(psp-config --psp-prefix)/share/cmake/PSP.cmake \
     $(psp-config --psp-prefix)/share/cmake/BuildPRX.cmake \
     $(psp-config --psp-prefix)/share/cmake/CreatePBP.cmake
