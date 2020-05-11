test_deps_install SDL libmikmod
get_pspport SDL_mixer SDL2_mixer-psp
PKG_CONFIG_LIBDIR="$(psp-config --psp-prefix)/lib/pkgconfig" \
  SDL_CFLAGS="-I$(psp-config --psp-prefix)/include/SDL2" SDL_LIBS="-lSDL2" \
  run_autogen_build --disable-music-cmd
