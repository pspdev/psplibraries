#!/bin/sh
# libmikmod.sh by Dan Peori (danpeori@oopo.net)

 ## Download the latest source code.
 if test ! -d "libmikmod"; then
  svn checkout svn://svn.ps2dev.org/psp/trunk/libmikmod || { exit 1; }
 else
  svn update libmikmod || { exit 1; }
 fi

 ## Enter the source directory.
 cd libmikmod || { exit 1; }

 ## Compile and install.
 make -f Makefile.psp clean && make -f Makefile.psp -j2 && make -f Makefile.psp install && make -f Makefile.psp clean || { exit 1; }
