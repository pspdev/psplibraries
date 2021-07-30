#!/bin/bash

 ## remove $CC and $CXX for configure
 unset CC
 unset CXX


 if [ "$(uname -o)" == "Msys" ]; then
	 mv $PSPDEV/bin/psp-gcc.exe $PSPDEV/bin/psp-gcc
	 mv $PSPDEV/bin/psp-g++.exe $PSPDEV/bin/psp-g++

	 cp $PSPDEV/bin/psp-gcc $PSPDEV/bin/psp-gcc.exe
	 cp $PSPDEV/bin/psp-g++ $PSPDEV/bin/psp-g++.exe
 fi

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
 cd "`dirname $0`" || { echo "ERROR: Could not enter the psplibraries directory."; exit 1; }

 source common.sh
 basepath=$PWD
 mkdir -p build || { echo "ERROR: Could not create the build directory."; exit 1; }
 test_deps psptoolchain libtool

 # If specific steps were requested, run the requested build scripts.
 if [ $1 ]; then
     buildall=0
     list="$@"
 # Else, run the all build scripts.
 else
     buildall=1
     list="$(ls -1 $basepath/scripts/*.sh | sed -e "s/.*\///" -e "s/\..*//" | sort -f)"
 fi

 faillist=""
 for step in $list; do
     f=$basepath/scripts/$step.sh
     test_deps $step
     if [ $? -ne 0 ] || [ $buildall -eq 0 ]; then
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

