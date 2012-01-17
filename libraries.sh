#!/bin/bash

 cd "`dirname $0`" || { echo "ERROR: Could not enter the psplibraries directory."; exit 1; }

 source common.sh
 basepath=$PWD
 mkdir -p build || { echo "ERROR: Could not create the build directory."; exit 1; }
 test_deps psptoolchain

 # If specific steps were requested, run the requested build scripts.
 if [ $1 ]; then
     list="$@"
 # Else, run the all build scripts.
 else
     list="$(ls -1 $basepath/scripts/*.sh | sed -e "s/.*\///" | sort)"
 fi

 faillist=""
 for step in $list; do
     f=$basepath/scripts/$step.sh
     if [ -x $f ]; then
         cd $basepath/build
         sh -c "source ../common.sh; \
         set -e; \
         basepath=$basepath; \
         source $f" || { echo "Failed installing $step!"; faillist="$faillist $step"; }
     else
         echo "Installation script for $step not found!"
     fi
 done
 echo "Installation finished.\nFailed installing:$faillist"

