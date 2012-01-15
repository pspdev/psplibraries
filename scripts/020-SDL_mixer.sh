#!/bin/sh
# SDL_mixer.sh by Dan Peori (dan.peori@oopo.net)

## Download the source code.
wget --continue --no-check-certificate https://github.com/pspdev/psp-ports/tarball/master -O psp-ports.tar.gz || { exit 1; }

## Unpack the source code.
rm -Rf psp-ports && mkdir psp-ports && tar --strip-components=1 --directory=psp-ports -xvzf psp-ports.tar.gz || { exit 1; }

## Enter the source directory.
cd psp-ports/SDL_mixer || { exit 1; }

## Bootstrap the source.
sh autogen.sh || { exit 1; }

## Configure the build.
LDFLAGS="-L$(psp-config --pspsdk-path)/lib" LIBS="-lc -lpspuser" ./configure --host psp --with-sdl-prefix=$(psp-config --psp-prefix) --prefix=$(psp-config --psp-prefix) --enable-music-mod --disable-music-mp3 || { exit 1; }

## Compile and install.
make -j 4 && make install || { exit 1; }
