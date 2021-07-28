#!/bin/sh
EXPAT_VERSION=2.4.1

download_and_extract "http://sourceforge.net/projects/expat/files/expat/$EXPAT_VERSION/expat-$EXPAT_VERSION.tar.gz"  expat-$EXPAT_VERSION
## Patch
cp ../../patches/config.sub ./config.sub
cp ../../patches/config.sub ./conftools/config.sub
run_configure
run_make

