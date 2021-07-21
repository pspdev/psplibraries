ZLIB_VERSION=1.2.11

download_and_extract http://sourceforge.net/projects/libpng/files/zlib/$ZLIB_VERSION/zlib-$ZLIB_VERSION.tar.gz zlib-$ZLIB_VERSION
psp-cmake $* .; make -j `num_cpus`; make install
