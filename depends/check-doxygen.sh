#!/bin/sh
# check-doxygen.sh by Sam Hegarty (samr.hegarty@gmail.com)

 ## Check for make.
 doxygen -v 1> /dev/null || { echo "ERROR: Install doxygen before continuing."; exit 1; }
