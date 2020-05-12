test_deps_install libpspvram pspgl
download_and_extract https://github.com/joel16/SDL2/archive/2.0.9.tar.gz SDL2-2.0.9
make -f Makefile.psp
make -f Makefile.main.psp
mkdir -p $(psp-config --psp-prefix)/include/SDL2
cp -v include/*.h $(psp-config --psp-prefix)/include/SDL2
cp -v libSDL2.a $(psp-config --psp-prefix)/lib
cp -v libSDL2main.a $(psp-config --psp-prefix)/lib
