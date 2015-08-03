#!/bin/sh

SCRIPT_DIR="`dirname \"$0\"`"
SCRIPT_DIR="`( cd \"$SCRIPT_DIR\" && pwd )`"
echo "$(tput setab 4) Cloning the necessary projects... $(tput sgr0)"
"$SCRIPT_DIR/clone.sh"
echo "$(tput setab 4) Applyig the needed patches... $(tput sgr0)"
"$SCRIPT_DIR/apply-patches.sh"
echo "$(tput setab 4) Building libclang... $(tput sgr0)"
"$SCRIPT_DIR/build.sh"
echo "$(tput setab 4) Generating a fatty static library... $(tput sgr0)"
"$SCRIPT_DIR/fatty.sh"
echo "$(tput setab 4) And we are done $(tput sgr0)"
