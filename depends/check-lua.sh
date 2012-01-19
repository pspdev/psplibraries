#!/bin/sh
 ls $(psp-config --psp-prefix)/include/luaconf.h \
    $(psp-config --psp-prefix)/include/lua.h \
    $(psp-config --psp-prefix)/include/lua.hpp \
    $(psp-config --psp-prefix)/include/lualib.h \
    $(psp-config --psp-prefix)/lib/liblua.a

