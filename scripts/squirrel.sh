download_and_extract http://squirrel.googlecode.com/files/squirrel_3_0_stable.tar.gz SQUIRREL3
apply_patch squirrel-3.0
AR="psp-ar" CC="psp-gcc" CXX="psp-g++" LIBS="-lc -lpspuser" run_make -j 4 sq32
cp -v lib/*.a $(psp-config --psp-prefix)/lib
cp -v include/*.h $(psp-config --psp-prefix)/include

