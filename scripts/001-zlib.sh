#!/bin/sh
# zlib.sh by Dan Peori (danpeori@oopo.net)

 ## Download the latest source code.
 if test ! -d "zlib"; then
  svn checkout svn://svn.ps2dev.org/psp/trunk/zlib || { exit 1; }
 else
  svn update zlib || { exit 1; }
 fi

 ## Enter the source directory.
 cd zlib || { exit 1; }

 ## Compile and install.
 make clean && make -j2 && make install && make clean || { exit 1; }
