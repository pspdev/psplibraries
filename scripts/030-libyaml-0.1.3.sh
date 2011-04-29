#!/bin/sh
# libyaml-0.1.3.sh by take_cheeze (takechi101010@gmail.com)

## Download
wget --continue http://pyyaml.org/download/libyaml/yaml-0.1.3.tar.gz -O libyaml-0.1.3.tar.gz

## Unpack
rm -Rf libyaml-0.1.3 && mkdir libyaml-0.1.3 && tar --strip-components=1 --directory=libyaml-0.1.3 -xzf libyaml-0.1.3.tar.gz || { exit 1; }

## Enter
cd libyaml-0.1.3 || { exit 1; }

## Patch
cp ../../patches/config.sub ./config/config.sub || { exit 1; }

## Configure
LDFLAGS="-L$(psp-config --pspsdk-path)/lib" LIBS="-lc -lpspuser" ./configure --host psp --prefix=$(psp-config --psp-prefix) || { exit 1; }

## Compile and Install
make -j 4 && make install || { exit 1; }
