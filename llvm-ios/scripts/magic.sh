#!/bin/sh

SCRIPT_DIR="`dirname \"$0\"`"
SCRIPT_DIR="`( cd \"$SCRIPT_DIR\" && pwd )`"

"$SCRIPT_DIR/clone.sh"
"$SCRIPT_DIR/apply-patches.sh"
"$SCRIPT_DIR/build.sh"
"$SCRIPT_DIR/fatty.sh"
