#!/bin/sh
# openal-soft.sh by take_cheeze (takechi101010@gmail.com)

test_deps_install cmake-toolchain-script pthreads-emb

OPENAL_VERSION=1.14

download_and_extract http://kcat.strangesoft.net/openal-releases/openal-soft-$OPENAL_VERSION.tar.bz2 openal-soft-$OPENAL_VERSION
apply_patch openal-$OPENAL_VERSION-PSP

## Run cmake
psp-cmake -D CMAKE_INSTALL_PREFIX=$(psp-config --psp-prefix) -D UTILS=OFF -D EXAMPLES=OFF . || { exit 1; }

## Compile and Install
run_make -j `num_cpus`
