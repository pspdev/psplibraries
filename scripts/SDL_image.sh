test_deps_install SDL libpng jpeg

download_and_extract http://www.libsdl.org/projects/SDL_image/release/SDL_image-1.2.12.tar.gz SDL_image-1.2.12
apply_patch SDL_image-1.2.12-PSP
LIBPNG_CFLAGS="$CFLAGS -I$(psp-config --psp-prefix)/include/libpng15/" LDFLAGS="-lpspirkeyb" run_autogen_build --disable-webp --with-sdl-prefix=$(psp-config --psp-prefix)

