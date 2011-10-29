#!/bin/sh
# SDL_gfx.sh by Dan Peori (dan.peori@oopo.net)

## Download the source code.
wget --continue --no-check-certificate https://github.com/pspdev/psp-ports/tarball/master -O psp-ports.tar.gz || { exit 1; }

## Unpack the source code.
rm -Rf psp-ports && mkdir psp-ports && tar --strip-components=1 --directory=psp-ports -xzf psp-ports.tar.gz || { exit 1; }

## Enter the source directory.
cd psp-ports/SDL_gfx || { exit 1; }

## Bootstrap the source.
sh autogen.sh || { exit 1; }

## Configure the build.
AR=psp-ar LDFLAGS="-L$(psp-config --pspsdk-path)/lib" LIBS="-lc -lpspuser" ./configure --host psp --with-sdl-prefix=$(psp-config --psp-prefix) --prefix=$(psp-config --psp-prefix) --disable-mmx --disable-shared || { exit 1; }

## Compile and install.
make -j 4 && make install || { exit 1; }
