download_and_extract http://www.sqlite.org/sqlite-3.7.3.tar.gz sqlite-3.7.3
apply_patch sqlite-3.7.3-PSP
mkdir build-ppu && cd build-ppu
LDFLAGS="-L$(psp-config --pspsdk-path)/lib -lc -lpspuser" \
CFLAGS="-DSQLITE_OS_OTHER=1 -DSQLITE_OS_PSP=1 -I$(psp-config --pspsdk-path)/include" \
../configure --host=psp --prefix=$(psp-config --psp-prefix) --disable-readline --disable-tcl --disable-threadsafe --disable-amalgamation
run_make -j 4

