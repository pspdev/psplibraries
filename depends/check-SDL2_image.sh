#!/bin/bash

PREFIX=$(psp-config --psp-prefix)

ls "$PREFIX"/include/SDL2/SDL_image.h \
   "$PREFIX"/lib/libSDL2_image.a
