test_deps_install SDL libmikmod
download_and_extract http://www.libsdl.org/projects/SDL_mixer/release/SDL_mixer-1.2.12.tar.gz SDL_mixer-1.2.12
apply_patch SDL_mixer-1.2.12-PSP
run_autogen_build --with-sdl-prefix=$(psp-config --psp-prefix) --enable-music-mod --disable-music-mp3

