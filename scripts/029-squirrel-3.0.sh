#!/bin/sh
# squirrel-3.0.sh by take_cheeze (takechi101010@gmail.com)

## Download
wget --continue http://squirrel.googlecode.com/files/squirrel_3_0_stable.tar.gz

## Unpack
rm -Rf squirrel-3.0 && mkdir squirrel-3.0 && tar --strip-components=1 --directory=squirrel-3.0 -xvzf squirrel_3_0_stable.tar.gz || { exit 1; }

## Enter
cd squirrel-3.0 || { exit 1; }

## Patch
cat ../../patches/squirrel-3.0.patch | patch -p1 || { exit 1; }

## Compile and Install
AR="psp-ar" CC="psp-gcc" CXX="psp-g++" LIBS="-lc -lpspuser" make -j 4 sq32
cp -v lib/*.a $(psp-config --psp-prefix)/lib
cp -v include/*.h $(psp-config --psp-prefix)/include
