#!/bin/bash

PREFIX=$(psp-config --psp-prefix)

ls "$PREFIX"/include/SDL2/SDL2_framerate.h \
   "$PREFIX"/include/SDL2/SDL2_gfxPrimitives.h \
   "$PREFIX"/include/SDL2/SDL2_imageFilter.h \
   "$PREFIX"/include/SDL2/SDL2_rotozoom.h \
   "$PREFIX"/lib/libSDL2_gfx.a
