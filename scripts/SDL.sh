download_and_extract http://www.libsdl.org/release/SDL-1.2.15.tar.gz SDL-1.2.15
apply_patch SDL-1.2.15-PSP
apply_patch SDL_glfuncs.h
run_autogen_build --enable-pspirkeyb

