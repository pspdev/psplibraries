#!/bin/sh
git clone https://github.com/pspdev/SDL SDL -b psp-v.1.2.15 
cd SDL

run_autogen_build --enable-pspirkeyb

