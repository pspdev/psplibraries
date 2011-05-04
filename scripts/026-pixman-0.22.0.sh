#!/bin/sh
# pixman-0.22.0.sh by take_cheeze (takechi101010@gmail.com)

## Download
wget --continue http://cairographics.org/releases/pixman-0.22.0.tar.gz

## Unpack
rm -Rf pixman-0.22.0 && mkdir pixman-0.22.0 && tar --strip-components=1 --directory=pixman-0.22.0 -xvzf pixman-0.22.0.tar.gz || { exit 1; }

## Enter
cd pixman-0.22.0 || { exit 1; }

## Patch
cp ../../patches/config.sub ./config.sub || { exit 1; }

## Configure
LDFLAGS="-L$(psp-config --pspsdk-path)/lib" LIBS="-lc -lpspuser" ./configure --host psp --prefix=$(psp-config --psp-prefix) || { exit 1; }

## Compile and Install
make -j 4 && make install || { exit 1; }
