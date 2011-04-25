#!/bin/sh
# pixman-0.20.2.sh by take_cheeze (takechi101010@gmail.com)

## Download
wget --continue http://cairographics.org/releases/pixman-0.20.2.tar.gz

## Unpack
rm -Rf pixman-0.20.2 && mkdir pixman-0.20.2 && tar --strip-components=1 --directory=pixman-0.20.2 -xvzf pixman-0.20.2.tar.gz || { exit 1; }

## Enter
cd pixman-0.20.2 || { exit 1; }

## Patch
cp ../../patches/config.sub ./config.sub || { exit 1; }

## Configure
LDFLAGS="-L$(psp-config --pspsdk-path)/lib" LIBS="-lc -lpspuser" ./configure --host psp --prefix=$(psp-config --psp-prefix) || { exit 1; }

## Compile and Install
make -j 4 && make install || { exit 1; }
