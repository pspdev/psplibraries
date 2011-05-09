#!/bin/sh
# check-ruby.sh by Dan Peori (danpeori@oopo.net)

 ## Check for ruby.
 ruby --version 1> /dev/null || { echo "ERROR: Install ruby before continuing."; exit 1; }
