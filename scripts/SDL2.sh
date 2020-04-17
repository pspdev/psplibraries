download_and_extract https://github.com/joel16/SDL2/archive/SDL-2.0.12.zip SDL2-SDL-2.0.12
make -f Makefile.psp
mkdir -p $(psp-config --psp-prefix)/include/SDL2
cp -v include/*.h $(psp-config --psp-prefix)/include/SDL2
cp -v libSDL2.a $(psp-config --psp-prefix)/lib
