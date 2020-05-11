test_deps_install SDL2
get_pspport SDL_gfx SDL2_gfx-psp
SDL_CFLAGS="-I$(psp-config --psp-prefix)/include/SDL2" SDL_LIBS="-lSDL2" \
  run_autogen_build --disable-mmx
