#!/bin/bash

PREFIX=$(psp-config --psp-prefix)

ls "$PREFIX"/include/SDL/SDL_image.h \
   "$PREFIX"/lib/libSDL_image.a
