#!/bin/sh
# lua.sh by Dan Peori (dan.peori@oopo.net)

## Download the source code.
wget --continue --no-check-certificate https://github.com/pspdev/psp-ports/tarball/master -O psp-ports.tar.gz || { exit 1; }

## Unpack the source code.
rm -Rf psp-ports && mkdir psp-ports && tar --strip-components=1 --directory=psp-ports -xzf psp-ports.tar.gz || { exit 1; }

## Enter the source directory.
cd psp-ports/lua || { exit 1; }

## Compile and install.
make -f Makefile.psp -j 4 && make -f Makefile.psp install || { exit 1; }
