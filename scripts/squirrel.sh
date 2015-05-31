download_and_extract http://sourceforge.net/projects/squirrel/files/squirrel_3_0_7_stable.tar.gz SQUIRREL3
apply_patch squirrel-3.0.7
AR="psp-ar" CC="psp-gcc" CXX="psp-g++" LIBS="-lc -lpspuser" make -j `num_cpus` -C squirrel sq32
AR="psp-ar" CC="psp-gcc" CXX="psp-g++" LIBS="-lc -lpspuser" make -j `num_cpus` -C sqstdlib sq32
cp -v lib/*.a $(psp-config --psp-prefix)/lib
cp -v include/*.h $(psp-config --psp-prefix)/include
