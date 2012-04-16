PIXMAN_VERSION=0.24.4

download_and_extract http://cairographics.org/releases/pixman-$PIXMAN_VERSION.tar.gz pixman-$PIXMAN_VERSION
cp ../../patches/config.sub ./config.sub
LIBS="-lz" run_configure
run_make -j 4

