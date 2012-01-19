#!/bin/sh
 ls $(psp-config --psp-prefix)/include/SDL/SDL_framerate.h \
    $(psp-config --psp-prefix)/include/SDL/SDL_gfxBlitFunc.h \
    $(psp-config --psp-prefix)/include/SDL/SDL_gfxPrimitives.h \
    $(psp-config --psp-prefix)/include/SDL/SDL_gfxPrimitives_font.h \
    $(psp-config --psp-prefix)/include/SDL/SDL_imageFilter.h \
    $(psp-config --psp-prefix)/include/SDL/SDL_rotozoom.h \
    $(psp-config --psp-prefix)/lib/libSDL_gfx.a

