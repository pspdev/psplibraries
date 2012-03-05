get_pspports pspgl

for i in glLockArraysEXT pspgl_dlist pspgl_vidmem
do
echo '#include <psptypes.h>' > $i.c.tmp
cat $i.c >> $i.c.tmp
cat $i.c.tmp > $i.c
done

run_make -j 4
