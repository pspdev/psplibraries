test_deps_install libpng
PIXMAN_VERSION=0.24.4

download_and_extract http://cairographics.org/releases/pixman-$PIXMAN_VERSION.tar.gz pixman-$PIXMAN_VERSION
cp -f ../../patches/config.sub ./config.sub
PNG_CFLAGS="-I$(psp-config --psp-prefix)/include" PNG_LIBS="-L$(psp-config --psp-prefix)/lib -lpng -lz" run_configure
run_make -j `num_cpus`
