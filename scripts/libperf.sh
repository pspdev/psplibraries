download_and_extract https://github.com/NT-Bourgeois-Iridescence-Technologies/PerfLib/archive/master.zip PerfLib-master
make -f MakefileLib
mkdir -p $(psp-config --psp-prefix)/include/
cp -v include/perflib.h $(psp-config --psp-prefix)/include/
cp -v lib/libPerf.a $(psp-config --psp-prefix)/lib
