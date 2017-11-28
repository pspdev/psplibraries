#!/bin/bash
# libraries-sudo.sh by Naomi Peori (naomi@peori.ca)

 ## Enter the psplibraries directory.
 cd "`dirname $0`" || { echo "ERROR: Could not enter the psplibraries directory."; exit 1; }

 ## Set up the environment.
 export PSPDEV=/usr/local/pspdev
 export PATH=$PATH:$PSPDEV/bin

 ## Run the libraries script.
 ./libraries.sh $@ || { echo "ERROR: Could not run the libraries script."; exit 1; }
