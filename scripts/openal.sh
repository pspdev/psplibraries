#!/bin/sh
# openal-soft.sh by take_cheeze (takechi101010@gmail.com)

test_deps cmake-toolchain-script pthreads-emb

OPENAL_VERSION=1.13

download_and_extract http://connect.creativelabs.com/openal/Downloads/openal-soft-$OPENAL_VERSION.tbz2 openal-soft-$OPENAL_VERSION

## replace memory.h with string.h
sed -i -e "s/memory\.h/string.h/" Alc/*.c || { exit 1; }

## Run cmake
psp-cmake -D CMAKE_INSTALL_PREFIX=$(psp-config --psp-prefix) . || { exit 1; }

## Compile and Install
run_make -j 4
