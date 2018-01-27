#!/bin/sh
# cmake-toolchain-script.sh by take_cheeze (takechi101010@gmail.com)
DESTDIR=$1
PSP_CMAKE_PATH=${DESTDIR}$(psp-config --pspdev-path)/bin
TOOLCHAIN_SCRIPT_PATH=${DESTDIR}$(psp-config --psp-prefix)/share/cmake

## copy toolchain script and psp-cmake
install -d $TOOLCHAIN_SCRIPT_PATH
install -m644 ../patches/PSP.cmake $TOOLCHAIN_SCRIPT_PATH || { exit 1; }
install -d $PSP_CMAKE_PATH
install -m755 ../patches/psp-cmake $PSP_CMAKE_PATH || { exit 1; }
