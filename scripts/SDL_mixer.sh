#!/bin/sh
set -e
test_deps SDL libmikmod
get_pspports SDL_mixer
run_autogen_build --with-sdl-prefix=$(psp-config --psp-prefix) --enable-music-mod --disable-music-mp3

