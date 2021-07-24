test_deps_install libpspvram pspgl
clone_git_repo github.com pspdev SDL psp-v2.0.14 

cd SDL
make -f Makefile.psp

mkdir -p $(psp-config --psp-prefix)/include/SDL2
cp -v include/*.h $(psp-config --psp-prefix)/include/SDL2
cp -v libSDL2.a $(psp-config --psp-prefix)/lib
