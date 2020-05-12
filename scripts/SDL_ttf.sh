test_deps_install SDL freetype
get_pspport SDL_ttf SDL_ttf-psp
PKG_CONFIG_LIBDIR="$(psp-config --psp-prefix)/lib/pkgconfig" \
  run_autogen_build --with-sdl-prefix=$(psp-config --psp-prefix) \
  --with-freetype-prefix=$(psp-config --psp-prefix) --without-x
