download_and_extract https://downloads.sourceforge.net/mikmod/libmikmod-3.3.11.1.tar.gz libmikmod-3.3.11.1

apply_patch libmikmod-3.3.11.1-PSP
run_configure --disable-alldrv --enable-psp --enable-aiff --enable-wav --enable-raw
run_make -j `num_cpus`
