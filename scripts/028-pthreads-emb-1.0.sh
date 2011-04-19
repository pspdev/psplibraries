#!/bin/sh
# pthreads-emb-1.0.sh by take_cheeze (takechi101010@gmail.com)

## Download
wget --continue --no-check-certificate https://github.com/take-cheeze/pthreads-emb/tarball/master -O pthreads-emb-1.0.tar.gz || { exit 1; }

## Unpack
rm -Rf pthreads-emb-1.0 && mkdir pthreads-emb-1.0 && tar --strip-components=1 --directory=pthreads-emb-1.0 -xvzf pthreads-emb-1.0.tar.gz || { exit 1; }

## Enter
cd pthreads-emb-1.0 || { exit 1; }

## Compile and Install
make -C platform/psp -j 4 && make -C platform/psp install || { exit 1; }
cp -v *.h `psp-config --psp-prefix`/include || { exit 1; }
