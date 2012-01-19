download_and_extract "http://jaist.dl.sourceforge.net/project/expat/expat/2.0.1/expat-2.0.1.tar.gz" expat-2.0.1
## Patch
cp ../../patches/config.sub ./config.sub
cp ../../patches/config.sub ./conftools/config.sub
run_configure
run_make

