download_and_extract https://github.com/NT-Bourgeois-Iridescence-Technologies/PerfLib/archive/master.zip PerfLib
make
mkdir -p $(psp-config --psp-prefix)/include/
cp -v include/perflib.h $(psp-config --psp-prefix)/include/
cp -v libPerf.a $(psp-config --psp-prefix)/lib
