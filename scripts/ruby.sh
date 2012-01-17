#!/bin/sh
set -e
download_and_extract ftp://ftp.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-p180.tar.bz2 ruby-1.9.2-p180
cp ../../patches/config.sub tool/config.sub
patch -p1 < ../../patches/ruby-1.9.2-p180.patch

## Configure
LDSHARED="psp-ld -Bdynamic -Bshareable" \
CFLAGS="-include sys/fd_set.h -I$(psp-config --pspsdk-path)/include -G0 -U RUSAGE_SELF -U NO_SAFE_RENAME -D PSP" \
LDFLAGS="-L$(psp-config --pspsdk-path)/lib -flto" \
LIBS="-lpthread-psp -lpspsdk -lc -lpspuser -lpspnet_inet" \
ac_cv_func_setpgrp_void="yes" \
./configure -C \
    --host=psp \
    --prefix=$(psp-config --psp-prefix) \
    --disable-install-doc

run_make -j 4

