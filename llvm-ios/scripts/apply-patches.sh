#!/bin/sh

SCRIPT_DIR="`dirname \"$0\"`"
SCRIPT_DIR="`( cd \"$SCRIPT_DIR\" && pwd )`"

SOURCE_DIR="$SCRIPT_DIR/../source"
PATCHES_DIR="$SCRIPT_DIR/../patches"

find "$PATCHES_DIR" -name *.patch -exec patch -d "$SOURCE_DIR" -p1 -i {} \;
