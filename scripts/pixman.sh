download_and_extract http://cairographics.org/releases/pixman-0.22.0.tar.gz pixman-0.22.0
cp ../../patches/config.sub ./config.sub
run_configure
run_make -j 4

