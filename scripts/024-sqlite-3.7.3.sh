#!/bin/sh
# sqlite-3.7.3.sh by Dan Peori (danpeori@oopo.net)

## Download the source code.
wget --continue http://www.sqlite.org/sqlite-3.7.3.tar.gz || { exit 1; }

## Unpack the source code.
rm -Rf sqlite-3.7.3 && tar xfvz sqlite-3.7.3.tar.gz && cd sqlite-3.7.3 || { exit 1; }

## Patch the source code.
cat ../../patches/sqlite-3.7.3-PSP.patch | patch -p1 || { exit 1; }

## Create the build directory.
mkdir build-ppu && cd build-ppu || { exit 1; }

## Configure the build.
LDFLAGS="-L$(psp-config --pspsdk-path)/lib -lc -lpspuser" ./configure --host=psp --prefix=$(psp-config --psp-prefix) || { exit 1; }

## Compile and install.
make -j4 && make install || { exit 1; }
