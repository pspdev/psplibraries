test_deps_install zlib

get_pspports libpng
chmod a+x ./autogen.sh && LDFLAGS="-L$(psp-config --pspsdk-path)/lib" LIBS="-lc -lpspuser" ./autogen.sh --host psp --prefix=$(psp-config --psp-prefix) || { exit 1; }
run_make -j 4
