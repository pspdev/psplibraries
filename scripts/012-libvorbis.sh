#!/bin/sh
# libvorbis.sh by Dan Peori (danpeori@oopo.net)

 ## Download the latest source code.
 if test ! -d "libvorbis"; then
  svn checkout svn://svn.ps2dev.org/psp/trunk/libvorbis || { exit 1; }
 else
  svn update libvorbis || { exit 1; }
 fi

 ## Enter the source directory.
 cd libvorbis || { exit 1; }

 ## Bootstrap the source.
 LDFLAGS="-L$(psp-config --pspsdk-path)/lib -lc -lpspuser" ./autogen.sh --host psp --prefix=$(psp-config --psp-prefix) || { exit 1; }

 ## Compile and install.
 make clean && make -j2 && make install && make clean || { exit 1; }
