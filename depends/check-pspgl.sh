#!/bin/sh
 ls $(psp-config --psp-prefix)/lib/libGL.a \
    $(psp-config --psp-prefix)/lib/libGLU.a \
    $(psp-config --psp-prefix)/include/GL \
    $(psp-config --psp-prefix)/include/GLES

