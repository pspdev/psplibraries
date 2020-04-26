#!/bin/sh

download_and_extract https://github.com/joel16/SDL2/archive/2.0.9.tar.gz SDL2-2.0.9

## Run cmake
mkdir build && cd build
psp-cmake .. || { exit 1; }

## Compile and Install
run_make -j `num_cpus`
