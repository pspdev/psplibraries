ZLIB_VERSION=1.2.8

download_and_extract http://sourceforge.net/projects/libpng/files/zlib/$ZLIB_VERSION/zlib-$ZLIB_VERSION.tar.gz zlib-$ZLIB_VERSION
apply_patch zlib-$ZLIB_VERSION-PSP
run_make -j `num_cpus`
