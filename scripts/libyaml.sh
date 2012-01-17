#!/bin/sh
set -e
download_and_extract http://pyyaml.org/download/libyaml/yaml-0.1.3.tar.gz yaml-0.1.3
cp ../../patches/config.sub ./config/config.sub
run_configure
run_make -j 4

