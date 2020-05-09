test_deps_install SDL libpng jpeg
get_pspport SDL_image SDL_image-psp
PKG_CONFIG_LIBDIR="$(psp-config --psp-prefix)/lib/pkgconfig" \
  run_autogen_build --with-sdl-prefix=$(psp-config --psp-prefix)
