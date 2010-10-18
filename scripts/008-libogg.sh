#!/bin/sh
# libogg.sh by Dan Peori (danpeori@oopo.net)

 ## Download the latest source code.
 if test ! -d "libogg"; then
  svn checkout svn://svn.ps2dev.org/psp/trunk/libogg || { exit 1; }
 else
  svn update libogg || { exit 1; }
 fi

 ## Enter the source directory.
 cd libogg || { exit 1; }

 ## Bootstrap the source.
 LDFLAGS="-L$(psp-config --pspsdk-path)/lib -lc -lpspuser" ./autogen.sh --host psp --prefix=$(psp-config --psp-prefix) || { exit 1; }

 ## Compile and install.
 make clean && make -j2 && make install && make clean || { exit 1; }
