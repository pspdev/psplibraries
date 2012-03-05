get_pspports pspgl

for i in glLockArraysEXT pspgl_dlist pspgl_vidmem;
do sed '1i \
#include <psptypes.h>' $i.c > $i.c;
done

run_make -j 4
