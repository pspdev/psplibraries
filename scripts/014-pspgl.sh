#!/bin/sh
# pspgl.sh by Dan Peori (danpeori@oopo.net)

 ## Download the latest source code.
 if test ! -d "pspgl"; then
  svn checkout svn://svn.ps2dev.org/psp/trunk/pspgl || { exit 1; }
 else
  svn update pspgl || { exit 1; }
 fi

 ## Enter the source directory.
 cd pspgl || { exit 1; }

 ## Compile and install.
 make clean && make -j2 && make install && make clean || { exit 1; }
