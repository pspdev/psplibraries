#!/bin/sh
get_pspports libogg
LDFLAGS="-L$(psp-config --pspsdk-path)/lib" LIBS="-lc -lpspuser" ./autogen.sh --host psp --prefix=$(psp-config --psp-prefix)
run_make -j `num_cpus`
