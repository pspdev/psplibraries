#!/bin/sh
# zziplib.sh by Dan Peori (danpeori@oopo.net)

 ## Download the latest source code.
 if test ! -d "zziplib"; then
  svn checkout svn://svn.ps2dev.org/psp/trunk/zziplib || { exit 1; }
 else
  svn update zziplib || { exit 1; }
 fi

 ## Enter the source directory.
 cd zziplib || { exit 1; }

 ## Configure the build.
 LDFLAGS="-L$(psp-config --pspsdk-path)/lib -lc -lpspuser" ./configure --host=psp --prefix=$(psp-config --psp-prefix)

 ## Compile and install.
 make clean && make -j2 && make install && make clean || { exit 1; }
