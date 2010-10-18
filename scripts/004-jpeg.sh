#!/bin/sh
# jpeg.sh by Dan Peori (danpeori@oopo.net)

 ## Download the latest source code.
 if test ! -d "jpeg"; then
  svn checkout svn://svn.ps2dev.org/psp/trunk/jpeg || { exit 1; }
 else
  svn update jpeg || { exit 1; }
 fi

 ## Enter the source directory.
 cd jpeg || { exit 1; }

 ## Compile and install.
 make clean && make -j2 && make install && make clean || { exit 1; }
