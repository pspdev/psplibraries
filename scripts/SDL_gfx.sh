test_deps SDL
get_pspports SDL_gfx
AR=psp-ar run_autogen_build --with-sdl-prefix=$(psp-config --psp-prefix) --disable-mmx --disable-shared

