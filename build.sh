#!/bin/bash

set -e

pushd $1
psp-makepkg -i
popd
