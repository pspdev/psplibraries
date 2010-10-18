#!/bin/sh
# libbulletml.sh by Dan Peori (danpeori@oopo.net)

 ## Download the latest source code.
 if test ! -d "libbulletml"; then
  svn checkout svn://svn.ps2dev.org/psp/trunk/libbulletml || { exit 1; }
 else
  svn update libbulletml || { exit 1; }
 fi

 ## Enter the source directory.
 cd libbulletml/src || { exit 1; }

 ## Compile and install.
 make clean && make -j2 && make install && make clean || { exit 1; }
