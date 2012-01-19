wget --continue --no-check-certificate https://github.com/take-cheeze/pthreads-emb/tarball/master -O pthreads-emb-1.0.tar.gz
rm -Rf pthreads-emb-1.0 && mkdir pthreads-emb-1.0 && tar --strip-components=1 --directory=pthreads-emb-1.0 -xvzf pthreads-emb-1.0.tar.gz
cd pthreads-emb-1.0
make -C platform/psp -j 4 && make -C platform/psp install
cp -v *.h `psp-config --psp-prefix`/include

