## test dependency
test_deps cmake-toolchain-script

ANGELSCRIPT_VERSION=2.22.2

download_and_extract http://www.angelcode.com/angelscript/sdk/files/angelscript_$ANGELSCRIPT_VERSION.zip sdk
cd angelscript/projects/cmake || { return 1; }

## Run cmake
psp-cmake -D CMAKE_INSTALL_PREFIX=$(psp-config --psp-prefix) . || { exit 1; }

## Compile and Install
make -j 4 || { exit 1; }
cp -v ../../include/*.h $(psp-config --psp-prefix)/include
cp -v ../../lib/lib*.a $(psp-config --psp-prefix)/lib
