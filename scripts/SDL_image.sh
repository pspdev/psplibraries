test_deps SDL
get_pspports SDL_image
LDFLAGS="-lpspirkeyb" run_autogen_build --with-sdl-prefix=$(psp-config --psp-prefix)

