#!/bin/sh
git clone https://github.com/pspdev/kubridge
cd kubridge; mkdir build; cd build
psp-cmake ..; make; make install
