#!/bin/sh
# ruby-1.9.2-p180.sh by take_cheeze (takechi101010@gmail.com)

## Download
wget --continue ftp://ftp.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-p180.tar.bz2 || { exit 1; }

## Unpack
rm -Rf ruby-1.9.2-p180 && mkdir ruby-1.9.2-p180 && tar --strip-components=1 --directory=ruby-1.9.2-p180 -xjf ruby-1.9.2-p180.tar.bz2 || { exit 1; }

## Enter
cd ruby-1.9.2-p180 || { exit 1; }

## Patch
cp ../../scripts/config.sub tool/config.sub
cat ../../patches/ruby-1.9.2-p180.patch | patch -p1 || { exit 1; }

## Configure
LDSHARED="psp-ld -Bdynamic -Bshareable" \
CFLAGS="-include sys/fd_set.h -I$(psp-config --pspsdk-path)/include -G0 -U RUSAGE_SELF -U NO_SAFE_RENAME -D PSP" \
LDFLAGS="-L$(psp-config --pspsdk-path)/lib -flto" \
LIBS="-lpthread-psp -lpspsdk -lc -lpspuser -lpspnet_inet" \
ac_cv_func_setpgrp_void="yes" \
./configure -C \
    --host=psp \
    --prefix=$(psp-config --psp-prefix) \
    --disable-install-doc \
|| { exit 1; }

## Compile and Install
make -j 4 && make install || { exit 1; }
