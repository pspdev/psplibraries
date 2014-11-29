test_deps_install zlib

LIBPNG_VERSION=1.5.7

download_and_extract http://sourceforge.net/projects/libpng/files/libpng15/older-releases/$LIBPNG_VERSION/libpng-$LIBPNG_VERSION.tar.gz libpng-$LIBPNG_VERSION
apply_patch libpng-$LIBPNG_VERSION-PSP
run_configure
run_make -j `num_cpus`
