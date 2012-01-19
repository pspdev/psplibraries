if test ! -d "smpeg-psp"; then
  svn checkout http://smpeg-psp.googlecode.com/svn/trunk smpeg-psp
else
  svn update smpeg-psp
fi
cd smpeg-psp
run_make -j 4

