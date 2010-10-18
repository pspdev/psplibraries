#!/bin/sh
# check-pspdev.sh by Dan Peori (danpeori@oopo.net)

 ## Check for psp-gcc.
 psp-gcc --version 1> /dev/null || { echo "ERROR: Install the psptoolchain before continuing."; exit 1; }
