#!/bin/sh
# freetype.sh by Dan Peori (danpeori@oopo.net)

 ## Download the latest source code.
 if test ! -d "freetype"; then
  svn checkout svn://svn.ps2dev.org/psp/trunk/freetype || { exit 1; }
 else
  svn update freetype || { exit 1; }
 fi

 ## Enter the source directory.
 cd freetype || { exit 1; }

 ## Bootstrap the source.
 sh autogen.sh || { exit 1; }

 ## Configure the build.
 LDFLAGS="-L$(psp-config --pspsdk-path)/lib -lc -lpspuser" ./configure --host psp --prefix=$(psp-config --psp-prefix) || { exit 1; }

 ## Compile and install.
 make clean && make -j2 && make install && make clean || { exit 1; }
