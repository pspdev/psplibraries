#!/bin/bash

set -e

chown -R build:build $1

pushd $1
sudo -u build psp-makepkg -i
popd
