if test ! -d "smpeg-psp"; then
  svn checkout http://smpeg-psp.googlecode.com/svn/trunk smpeg-psp
else
  svn update smpeg-psp
fi
cd smpeg-psp
sed -i -e "s/static __inline__ Uint16 SDL_Swap16(Uint16 x)/static __inline__ Uint16 Disable_SDL_Swap16(Uint16 x)/" audio/*.cpp || { exit 1; }
run_make -j 4

