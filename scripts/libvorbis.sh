#!/bin/sh
get_pspports libvorbis
LDFLAGS="-L$(psp-config --pspsdk-path)/lib" LIBS="-lc -lpspuser" ./autogen.sh --host psp --prefix=$(psp-config --psp-prefix) || { exit $(false); }
run_make -j `num_cpus`
