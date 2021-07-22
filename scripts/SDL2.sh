test_deps_install libpspvram pspgl
git clone https://github.com/pspdev/SDL SDL2 -b psp-v2.0.14 --depth=1
cd SDL2
make -f Makefile.psp

mkdir -p $(psp-config --psp-prefix)/include/SDL2
cp -v include/*.h $(psp-config --psp-prefix)/include/SDL2
cp -v libSDL2.a $(psp-config --psp-prefix)/lib
