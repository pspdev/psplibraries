test_deps_install zlib

get_pspports libpng
run_make -j 4

ln -s $(psp-config --psp-prefix)/lib/libpng.a $(psp-config --psp-prefix)/lib/libpng12.a
