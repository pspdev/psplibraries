#!/bin/sh
# openal-soft.sh by take_cheeze (takechi101010@gmail.com)

OPENAL_VERSION=1.13

# Download
wget --continue http://connect.creativelabs.com/openal/Downloads/openal-soft-$OPENAL_VERSION.tbz2 || { exit 1; }

## Unpack
rm -Rf openal-soft-$OPENAL_VERSION && mkdir openal-soft-$OPENAL_VERSION && tar --strip-components=1 --directory=openal-soft-$OPENAL_VERSION -xjf openal-soft-$OPENAL_VERSION.tbz2 || { exit 1; }

## Enter
cd openal-soft-$OPENAL_VERSION || { exit 1; }

## replace memory.h with string.h
sed -i -e "s/memory\.h/string.h/" Alc/*.c || { exit 1; }

## Run cmake
psp-cmake -D CMAKE_INSTALL_PREFIX=$(psp-config --psp-prefix) . || { exit 1; }

## Compile and Install
make -j 4 && make install || { exit 1; }
