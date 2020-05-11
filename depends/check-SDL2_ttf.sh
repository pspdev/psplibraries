#!/bin/bash

PREFIX=$(psp-config --psp-prefix)

ls "$PREFIX"/include/SDL2/SDL_ttf.h \
   "$PREFIX"/lib/libSDL2_ttf.a
