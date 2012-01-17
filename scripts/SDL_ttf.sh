test_deps SDL freetype
get_pspports SDL_ttf
run_autogen_build --with-sdl-prefix=$(psp-config --psp-prefix) --with-freetype=$(psp-config --psp-prefix) --without-x

