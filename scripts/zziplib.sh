test_deps_install zlib
get_pspports zziplib
run_configure
run_make -j `num_cpus`
