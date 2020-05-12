test_deps_install SDL
get_pspport SDL_gfx SDL_gfx-psp
run_autogen_build --with-sdl-prefix=$(psp-config --psp-prefix) \
  --disable-mmx
