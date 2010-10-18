#!/bin/sh
# sqlite.sh by Dan Peori (danpeori@oopo.net)

 ## Download the latest source code.
 if test ! -d "sqlite"; then
  svn checkout svn://svn.ps2dev.org/psp/trunk/sqlite || { exit 1; }
 else
  svn update sqlite || { exit 1; }
 fi

 ## Enter the source directory.
 cd sqlite || { exit 1; }

 ## Configure the build.
 LDFLAGS="-L$(psp-config --pspsdk-path)/lib -lc -lpspuser" ./configure --host=psp --disable-readline --disable-tcl --prefix=$(psp-config --psp-prefix) || { exit 1; }

 ## Compile and install.
 make clean && make -j2 && make install && make clean || { exit 1; }
