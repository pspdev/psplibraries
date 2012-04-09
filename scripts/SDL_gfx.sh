test_deps_install SDL
download_and_extract http://sourceforge.net/projects/sdlgfx/files/SDL_gfx-2.0.23.tar.gz SDL_gfx-2.0.23
apply_patch SDL_gfx-2.0.23-PSP
AR=psp-ar run_autogen_build --with-sdl-prefix=$(psp-config --psp-prefix) --disable-mmx --disable-shared

