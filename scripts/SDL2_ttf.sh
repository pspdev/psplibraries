test_deps_install SDL2 freetype
get_pspport SDL_ttf SDL2_ttf-psp
PKG_CONFIG_LIBDIR="$(psp-config --psp-prefix)/lib/pkgconfig" \
  SDL_CFLAGS="-I$(psp-config --psp-prefix)/include/SDL2" SDL_LIBS="-lSDL2" \
  run_autogen_build --without-x
