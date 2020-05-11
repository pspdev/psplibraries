#!/bin/sh

PREFIX=$(psp-config --psp-prefix)

ls "$PREFIX"/include/SDL/SDL_ttf.h \
   "$PREFIX"/lib/libSDL_ttf.a
