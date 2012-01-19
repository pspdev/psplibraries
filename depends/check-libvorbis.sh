#!/bin/sh
 ls $(psp-config --psp-prefix)/lib/libvorbis.a \
    $(psp-config --psp-prefix)/lib/libvorbisenc.a \
    $(psp-config --psp-prefix)/lib/libvorbisfile.a  \
    $(psp-config --psp-prefix)/include/vorbis

