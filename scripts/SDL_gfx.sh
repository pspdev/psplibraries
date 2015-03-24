test_deps_install SDL
download_and_extract http://sourceforge.net/projects/sdlgfx/files/SDL_gfx-2.0.25.tar.gz SDL_gfx-2.0.25
apply_patch SDL_gfx-2.0.25-PSP
autoreconf --force --install
run_configure --prefix=$(psp-config --psp-prefix) --host=psp --disable-mmx --disable-shared
run_make
