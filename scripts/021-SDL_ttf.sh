#!/bin/sh
# SDL_ttf.sh by Dan Peori (danpeori@oopo.net)

 ## Download the latest source code.
 if test ! -d "SDL_ttf"; then
  svn checkout svn://svn.ps2dev.org/psp/trunk/SDL_ttf || { exit 1; }
 else
  svn update SDL_ttf || { exit 1; }
 fi

 ## Enter the source directory.
 cd SDL_ttf || { exit 1; }

 ## Bootstrap the source.
 sh autogen.sh || { exit 1; }

 ## Configure the build.
 LDFLAGS="-L$(psp-config --pspsdk-path)/lib -lpspirkeyb -lc -lpspuser" ./configure --host psp --with-sdl-prefix=$(psp-config --psp-prefix) --with-freetype-prefix=$(psp-config --psp-prefix) --without-x --prefix=$(psp-config --psp-prefix) || { exit 1; }

 ## Compile and install.
 make clean && make -j2 && make install && make clean || { exit 1; }
