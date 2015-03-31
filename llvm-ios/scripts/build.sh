#!/bin/sh

#
# Based on:
#   https://gist.github.com/SquaredTiki/d5da9d1c1ee78a587c76
#

SYSROOT_SIM="/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator8.1.sdk"
SYSROOT_OS="/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS8.1.sdk"
MIN_VERSION="8.0"

SCRIPT_DIR="`dirname \"$0\"`"
SCRIPT_DIR="`( cd \"$SCRIPT_DIR\" && pwd )`"
SOURCE_DIR="$SCRIPT_DIR/../source"
LLVM_DIR="$SOURCE_DIR/llvm"

BUILD_DIR="$SCRIPT_DIR/../build"
INSTALL_DIR="$SCRIPT_DIR/../install"

function build_clang_for_arch {
	local ARCH="$1"
	local HOST="$2"
	local IOS_MIN_ARG="$3"
	local SYSROOT="$4"
	
	local PREFIX_DIR="$INSTALL_DIR/$ARCH"
	rm -rf "$PREFIX_DIR"
	mkdir -p "$PREFIX_DIR"

	export CC="clang -arch $ARCH $IOS_MIN_ARG -isysroot $SYSROOT -stdlib=libc++ -Os"
	export CXX="clang++ -arch $ARCH $IOS_MIN_ARG -isysroot $SYSROOT -stdlib=libc++ -Os"

	rm -rf "$BUILD_DIR"
	mkdir -p "$BUILD_DIR"
	cd "$BUILD_DIR"
	pwd
	"$LLVM_DIR/configure" \
	  --prefix="$PREFIX_DIR" \
	  --host="$HOST" \
	  --enable-optimized \
	  --disable-assertions \
	  --disable-debug
	  
	unset CC CXX
	
	make DEPLOYMENT_TARGET="$IOS_MIN_ARG" VERBOSE=1 -j4
	make install
}

build_clang_for_arch "armv7" "arm-apple-darwin11" "-mios-version-min=$MIN_VERSION" "$SYSROOT_OS"
build_clang_for_arch "arm64" "arm-apple-darwin11" "-mios-version-min=$MIN_VERSION" "$SYSROOT_OS"
build_clang_for_arch "x86_64" "x86_64-apple-darwin11" "-mios-simulator-version-min=$MIN_VERSION" "$SYSROOT_SIM"
build_clang_for_arch "i386" "i386-apple-darwin11" "-mios-simulator-version-min=$MIN_VERSION" "$SYSROOT_SIM"
