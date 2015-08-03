#!/bin/sh

SCRIPT_DIR="`dirname \"$0\"`"
SCRIPT_DIR="`( cd \"$SCRIPT_DIR\" && pwd )`"

LIB_DIR="$SCRIPT_DIR/lib/libclang/lib"
lipo -create "$LIB_DIR/libclang-arm64.a" "$LIB_DIR/libclang-armv7.a" "$LIB_DIR/libclang-i386.a" "$LIB_DIR/libclang-x86_64.a" -output "$LIB_DIR/libclang.a"
