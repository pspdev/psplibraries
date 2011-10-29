#!/bin/sh
# expat-2.0.1.sh by take_cheeze (takechi101010@gmail.com)

## Download
wget --continue "http://jaist.dl.sourceforge.net/project/expat/expat/2.0.1/expat-2.0.1.tar.gz" || { exit 1; }

## Unpack
rm -Rf expat-2.0.1 && mkdir expat-2.0.1 && tar --strip-components=1 --directory=expat-2.0.1 -xzf expat-2.0.1.tar.gz || { exit 1; }

## Enter
cd expat-2.0.1 || { exit 1; }

## Patch
cp ../../patches/config.sub ./config.sub || { exit 1; }
cp ../../patches/config.sub ./conftools/config.sub || { exit 1; }

## Configure
LDFLAGS="-L$(psp-config --pspsdk-path)/lib -lc -lpspuser" LIBS="-lc -lpspuser" ./configure --host=psp --prefix=$(psp-config --psp-prefix) || { exit 1; }

## Compile and Install
make && make install || { exit 1; }
