#!/bin/sh

LLVM_BRANCH=release_36
CLANG_BRANCH=release_36
COMPILER_RT_BRANCH=release_36
MAX_DEPTH=1

SCRIPT_DIR="`dirname \"$0\"`"
SCRIPT_DIR="`( cd \"$SCRIPT_DIR\" && pwd )`"

SOURCE_DIR="$SCRIPT_DIR/../source"
rm -rf "$SOURCE_DIR"
mkdir -p "$SOURCE_DIR"

git clone -b $LLVM_BRANCH --depth $MAX_DEPTH http://llvm.org/git/llvm.git "$SOURCE_DIR/llvm"
git clone -b $CLANG_BRANCH --depth $MAX_DEPTH http://llvm.org/git/clang.git "$SOURCE_DIR/llvm/tools/clang"
git clone -b $COMPILER_RT_BRANCH --depth $MAX_DEPTH http://llvm.org/git/compiler-rt.git "$SOURCE_DIR/llvm/projects/compiler-rt"
