test_deps_install SDL freetype
download_and_extract http://www.libsdl.org/projects/SDL_ttf/release/SDL_ttf-2.0.10.tar.gz SDL_ttf-2.0.10
apply_patch SDL_ttf-2.0.10-PSP
run_autogen_build --with-sdl-prefix=$(psp-config --psp-prefix) --with-freetype=$(psp-config --psp-prefix) --without-x

