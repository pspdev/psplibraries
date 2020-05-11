test_deps_install SDL
get_pspport SDL_gfx SDL_gfx-psp
autoreconf --force --install -I $(psp-config --psp-prefix)/share/aclocal
cp ../../patches/config.sub ./config.sub
run_autogen_build --with-sdl-prefix=$(psp-config --psp-prefix) \
  --disable-mmx
