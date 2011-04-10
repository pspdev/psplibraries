#!/bin/sh
# openTRI.sh by Sam Hegarty (samr.hegarty@gmail.com)

## Download the source code.
wget --continue --no-check-certificate https://github.com/SamRH/openTRI/tarball/master -O openTRI.tar.gz || { exit 1; }

## Unpack the source code.
rm -Rf openTRI && mkdir openTRI && tar --strip-components=1 --directory=openTRI -xvzf openTRI.tar.gz || { exit 1; }

## Enter the source directory.
cd openTRI || { exit 1; }

## Compile and install.
make -j 4 && make install CP=cp MKDIR=mkdir PNG=1 FT=1 || { exit 1; }
