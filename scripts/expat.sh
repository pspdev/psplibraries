EXPAT_VERSION=2.1.0

download_and_extract http://jaist.dl.sourceforge.net/project/expat/expat/$EXPAT_VERSION/expat-$EXPAT_VERSION.tar.gz expat-$EXPAT_VERSION
## Patch
cp ../../patches/config.sub ./config.sub
cp ../../patches/config.sub ./conftools/config.sub
run_configure
run_make

