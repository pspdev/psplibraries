#!/bin/sh
# cmake-toolchain-script.sh by take_cheeze (takechi101010@gmail.com)

test_deps cmake

PSP_CMAKE_PATH=$(psp-config --pspdev-path)/bin/psp-cmake
TOOLCHAIN_SCRIPT_PATH=$(psp-config --psp-prefix)/share/cmake-2.8/Modules/Platform

## copy toolchain script and psp-cmake
cp ../patches/PSP.cmake $TOOLCHAIN_SCRIPT_PATH || { exit 1; }
cp ../patches/psp-cmake $PSP_CMAKE_PATH || { exit 1; }
