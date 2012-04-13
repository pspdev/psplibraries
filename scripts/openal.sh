#!/bin/sh
# openal-soft.sh by take_cheeze (takechi101010@gmail.com)

test_deps_install cmake-toolchain-script pthreads-emb

OPENAL_VERSION=1.14

download_and_extract http://kcat.strangesoft.net/openal-releases/openal-soft-$OPENAL_VERSION.tar.bz2 openal-soft-$OPENAL_VERSION

## replace memory.h with string.h
sed -i -e "s/memory\.h/string.h/" Alc/*.c Alc/backends/*.c || { exit 1; }

## Run cmake
psp-cmake -D CMAKE_INSTALL_PREFIX=$(psp-config --psp-prefix) . || { exit 1; }

## Compile and Install
run_make -j 4
