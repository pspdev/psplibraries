#!/bin/sh
# check-cmake-toolchain-script.sh by Takeshi Watanabe (takechi101010@gmail.com)

 ## Check for cmake toolchain script.
 $(psp-config --pspdev-path)/bin/psp-cmake
 $(psp-config --psp-prefix)/share/cmake-2.8/Modules/Platform
