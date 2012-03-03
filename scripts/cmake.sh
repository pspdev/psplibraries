#!/bin/sh
# cmake.sh by take_cheeze (takechi101010@gmail.com)

CMAKE_VERSION=2.8.7

## Download
download_and_extract http://www.cmake.org/files/v2.8/cmake-$CMAKE_VERSION.tar.gz cmake-$CMAKE_VERSION

## Configure
./configure --prefix=$(psp-config --psp-prefix) || { exit 1; }

## Compile and Install
run_make -j 4
