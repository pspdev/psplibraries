download_and_extract http://downloads.sourceforge.net/project/mikmod/outdated_versions/libmikmod/3.2.0/libmikmod-3.2.0.tar.gz libmikmod-3.2.0
apply_patch libmikmod-3.2.0-PSP
aclocal --force
libtoolize --force
aclocal --force
autoconf --force
autoheader --force
automake --add-missing
run_configure --disable-esd
run_make -j 4

