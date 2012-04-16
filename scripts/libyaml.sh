LIBYAML_VERSION=0.1.4

download_and_extract http://pyyaml.org/download/libyaml/yaml-$LIBYAML_VERSION.tar.gz yaml-$LIBYAML_VERSION
cp ../../patches/config.sub ./config/config.sub
run_configure
run_make -j 4

