test_deps_install SDL libmikmod
get_pspport SDL_mixer SDL_mixer-psp
PKG_CONFIG_LIBDIR="$(psp-config --psp-prefix)/lib/pkgconfig" \
  run_autogen_build --with-sdl-prefix=$(psp-config --psp-prefix) \
  --disable-music-cmd --disable-music-mp3
