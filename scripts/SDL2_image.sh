test_deps_install SDL2 libpng jpeg
get_pspport SDL_image SDL2_image-psp

# This is used when there is no pkg-config, but needs sdl2-config
#EXTRA_FLAGS="--with-sdl-prefix=$(psp-config --psp-prefix)"
# Force pkg-config flags, until our SDL2 ships it
SDL_CFLAGS="-I$(psp-config --psp-prefix)/include/SDL2" SDL_LIBS="-lSDL2" \
  run_autogen_build $EXTRA_FLAGS
