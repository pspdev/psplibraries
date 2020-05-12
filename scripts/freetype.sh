test_deps_install zlib
get_pspport freetype2 freetype2-psp
PKG_CONFIG_LIBDIR="$(psp-config --psp-prefix)/lib/pkgconfig" \
  run_autogen_build --enable-freetype-config \
  --without-bzip2 --without-png
