#!/bin/sh
# lua.sh by Dan Peori (danpeori@oopo.net)

 ## Download the latest source code.
 if test ! -d "lua"; then
  svn checkout svn://svn.ps2dev.org/psp/trunk/lua || { exit 1; }
 else
  svn update lua || { exit 1; }
 fi

 ## Enter the source directory.
 cd lua || { exit 1; }

 ## Compile and install.
 make -f Makefile.psp clean && make -f Makefile.psp -j2 && make -f Makefile.psp install && make -f Makefile.psp clean || { exit 1; }
