#!/bin/sh
 ls $(psp-config --psp-prefix)/include/sqlite3.h \
    $(psp-config --psp-prefix)/include/sqlite3ext.h \
    $(psp-config --psp-prefix)/lib/libsqlite3.a

