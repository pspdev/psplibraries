#!/bin/sh
# libmad.sh by Dan Peori (danpeori@oopo.net)

 ## Download the latest source code.
 if test ! -d "libmad"; then
  svn checkout svn://svn.ps2dev.org/psp/trunk/libmad || { exit 1; }
 else
  svn update libmad || { exit 1; }
 fi

 ## Enter the source directory.
 cd libmad || { exit 1; }

 ## Compile and install.
 make clean && make -j2 && make install && make clean || { exit 1; }
