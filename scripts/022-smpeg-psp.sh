#!/bin/sh
# smpeg-psp.sh by Dan Peori (danpeori@oopo.net)

 ## Download the latest source code.
 if test ! -d "smpeg-psp"; then
  svn checkout http://smpeg-psp.googlecode.com/svn/trunk smpeg-psp || { exit 1; }
 else
  svn update smpeg-psp || { exit 1; }
 fi

 ## Enter the source directory.
 cd smpeg-psp || { exit 1; }

 ## Compile and install.
 make clean && make -j2 && make install && make clean || { exit 1; }
