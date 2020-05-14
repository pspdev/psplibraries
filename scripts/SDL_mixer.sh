test_deps_install SDL libmikmod
get_pspport SDL_mixer SDL_mixer-psp
run_autogen_build --with-sdl-prefix=$(psp-config --psp-prefix) \
  --disable-music-cmd --disable-music-mp3
