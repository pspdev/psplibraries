#!/bin/bash

 ## remove $CC and $CXX for configure
 unset CC
 unset CXX

 ## Set executable name for libtoolize
 if [ "$(uname)" == "Darwin" ]; then
     LIBTOOLIZE=glibtoolize
 else
     LIBTOOLIZE=libtoolize
 fi
 export LIBTOOLIZE

 ## Enforce pkg-config path, to not get fooled by host libraries
 unset PKG_CONFIG_PATH
 export PKG_CONFIG_LIBDIR="$(psp-config --psp-prefix)/lib/pkgconfig"

 ## Enter the psplibraries directory.
 cd "`dirname $0`" || { echo "ERROR: Could not enter the psplibraries directory."; exit $(false); }

 source common.sh
 basepath=$PWD
 mkdir -p build || { echo "ERROR: Could not create the build directory."; exit $(false); }
 test_deps psptoolchain libtool

 # If specific steps were requested, run the requested build scripts.
 if [ $1 ]; then
     buildall=$(false)
     list="$@"
 # Else, run the all build scripts.
 else
     buildall=$(true)
     list="$(ls -1 $basepath/scripts/*.sh | sed -e "s/.*\///" -e "s/\..*//" | sort -f)"
 fi

 faillist=""
 for step in $list; do
     f=$basepath/scripts/$step.sh
     test_deps $step
     if [ $? -ne 0 ] || [ $buildall -eq $(false) ]; then
         if [ -x $f ]; then
             cd $basepath/build
             bash -c "source ../common.sh; \
             set -e; \
             basepath=$basepath; \
             source $f" || { echo "Failed installing $step!"; faillist="$faillist $step"; }
         else
             echo "Installation script for $step not found!"
         fi
     else
         echo "$step already installed"
     fi
 done
 echo "Installation finished."
 if [ -n "$faillist" ]; then
     echo "Failed installing:$faillist"
 fi

