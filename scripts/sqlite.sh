download_and_extract https://www.sqlite.org/src/tarball/26778480/SQLite-26778480.tar.gz SQLite-26778480
apply_patch sqlite-3.7.3-PSP
mkdir build-ppu && cd build-ppu
LDFLAGS="-L$(psp-config --pspsdk-path)/lib -lc -lpspuser" \
CFLAGS="-DSQLITE_OS_OTHER=1 -DSQLITE_OS_PSP=1 -I$(psp-config --pspsdk-path)/include" \
../configure --host=psp --prefix=$(psp-config --psp-prefix) --disable-readline --disable-tcl --disable-threadsafe --disable-amalgamation
run_make -j `num_cpus`

