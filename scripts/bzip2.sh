BZIP2_VERSION=1.0.6

download_and_extract http://www.bzip.org/$BZIP2_VERSION/bzip2-$BZIP2_VERSION.tar.gz bzip2-$BZIP2_VERSION
apply_patch bzip2-$BZIP2_VERSION-PSP
run_make -j `num_cpus`
