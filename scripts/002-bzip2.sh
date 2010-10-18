#!/bin/sh
# bzip2.sh by Dan Peori (danpeori@oopo.net)

 ## Download the latest source code.
 if test ! -d "bzip2"; then
  svn checkout svn://svn.ps2dev.org/psp/trunk/bzip2 || { exit 1; }
 else
  svn update bzip2 || { exit 1; }
 fi

 ## Enter the source directory.
 cd bzip2 || { exit 1; }

 ## Compile and install.
 make clean && make -j2 && make install && make clean || { exit 1; }
