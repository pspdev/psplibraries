#!/bin/sh
# libpspvram.sh by Dan Peori (danpeori@oopo.net)

 ## Download the latest source code.
 if test ! -d "libpspvram"; then
  svn checkout svn://svn.ps2dev.org/psp/trunk/libpspvram || { exit 1; }
 else
  svn update libpspvram || { exit 1; }
 fi

 ## Enter the source directory.
 cd libpspvram || { exit 1; }

 ## Compile and install.
 make clean && make -j2 && make install && make clean || { exit 1; }
