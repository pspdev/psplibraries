test_deps_install libpspvram pspgl
<<<<<<< HEAD
git clone https://github.com/pspdev/SDL SDL2 -b psp-v2.0.14 --depth=1 
=======
clone_git_repo github.com pspdev SDL psp-v2.0.14 
>>>>>>> parent of d6a9075... Fix the common script to allow for custom repo names updated SDL scripts

cd SDL2
make -f Makefile.psp

mkdir -p $(psp-config --psp-prefix)/include/SDL2
cp -v include/*.h $(psp-config --psp-prefix)/include/SDL2
cp -v libSDL2.a $(psp-config --psp-prefix)/lib
