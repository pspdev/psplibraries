#!/bin/bash

PREFIX=$(psp-config --psp-prefix)

ls "$PREFIX"/include/SDL2/SDL_mixer.h \
   "$PREFIX"/lib/libSDL2_mixer.a
