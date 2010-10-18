#!/bin/sh
# SDL_mixer.sh by Dan Peori (danpeori@oopo.net)

 ## Download the latest source code.
 if test ! -d "SDL_mixer"; then
  svn checkout svn://svn.ps2dev.org/psp/trunk/SDL_mixer || { exit 1; }
 else
  svn update SDL_mixer || { exit 1; }
 fi

 ## Enter the source directory.
 cd SDL_mixer || { exit 1; }

 ## Bootstrap the source.
 sh autogen.sh || { exit 1; }

 ## Configure the build.
 LDFLAGS="-L$(psp-config --pspsdk-path)/lib -lc -lpspuser" ./configure --host psp --with-sdl-prefix=$(psp-config --psp-prefix) --prefix=$(psp-config --psp-prefix) --enable-music-mod || { exit 1; }

 ## Compile and install.
 make clean && make -j2 && make install && make clean || { exit 1; }
