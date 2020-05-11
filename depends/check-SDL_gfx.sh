#!/bin/sh

PREFIX=$(psp-config --psp-prefix)

ls "$PREFIX"/include/SDL/SDL_framerate.h \
   "$PREFIX"/include/SDL/SDL_gfxBlitFunc.h \
   "$PREFIX"/include/SDL/SDL_gfxPrimitives.h \
   "$PREFIX"/include/SDL/SDL_gfxPrimitives_font.h \
   "$PREFIX"/include/SDL/SDL_imageFilter.h \
   "$PREFIX"/include/SDL/SDL_rotozoom.h \
   "$PREFIX"/lib/libSDL_gfx.a
