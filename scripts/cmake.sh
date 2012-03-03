#!/bin/sh
# cmake.sh by take_cheeze (takechi101010@gmail.com)

CMAKE_VERSION=2.8.4

## Download
wget --continue http://www.cmake.org/files/v2.8/cmake-$CMAKE_VERSION.tar.gz

## Unpack
rm -Rf cmake-$CMAKE_VERSION && mkdir cmake-$CMAKE_VERSION && tar --strip-components=1 --directory=cmake-$CMAKE_VERSION -xzf cmake-$CMAKE_VERSION.tar.gz || { exit 1; }

## Enter
cd cmake-$CMAKE_VERSION || { exit 1; }

## Configure
./configure --prefix=$(psp-config --psp-prefix) || { exit 1; }

## Compile and Install
make -j 4 && make install || { exit 1; }
