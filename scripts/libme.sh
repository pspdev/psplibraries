download_and_extract https://github.com/NT-Bourgeois-Iridescence-Technologies/MElib/archive/v1.1.tar.gz MElib-1.1
make -f MakefileLib
mkdir -p $(psp-config --psp-prefix)/bin/MElib
mkdir -p $(psp-config --psp-prefix)/include/MElib
cp -v include/*.h $(psp-config --psp-prefix)/include/MElib
cp -v bin/*.prx $(psp-config --psp-prefix)/bin/MElib
cp -v lib/libME.a $(psp-config --psp-prefix)/lib
