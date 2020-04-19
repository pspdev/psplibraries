download_and_extract https://github.com/NT-Bourgeois-Iridescence-Technologies/MElib/archive/master.zip MElib
make
mkdir -p $(psp-config --psp-prefix)/bin/MElib
mkdir -p $(psp-config --psp-prefix)/include/MElib
cp -v include/*.h $(psp-config --psp-prefix)/include/MElib
cp -v bin/*.prx $(psp-config --psp-prefix)/bin/MElib
cp -v libME.a $(psp-config --psp-prefix)/lib