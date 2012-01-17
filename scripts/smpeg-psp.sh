#!/bin/sh
# smpeg-psp.sh by Dan Peori (dan.peori@oopo.net)

set -e

## Download the latest source code.
if test ! -d "smpeg-psp"; then
  svn checkout http://smpeg-psp.googlecode.com/svn/trunk smpeg-psp
else
  svn update smpeg-psp
fi

## Enter the source directory.
cd smpeg-psp

## Compile and install.
run_make -j 4

