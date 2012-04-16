download_and_extract http://mikmod.raphnet.net/files/libmikmod-3.2.0-beta2.tar.gz libmikmod-3.2.0-beta2
apply_patch libmikmod-3.2.0-beta2-PSP
autoconf
run_configure --disable-esd
run_make -j 4

