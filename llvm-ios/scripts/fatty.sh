#!/bin/sh

SCRIPT_DIR="`dirname \"$0\"`"
SCRIPT_DIR="`( cd \"$SCRIPT_DIR\" && pwd )`"

INSTALL_DIR="$SCRIPT_DIR/../install"

LIB_DIR="$SCRIPT_DIR/../libclang/lib"
HEADERS_DIR="$SCRIPT_DIR/../libclang/include/clang-c"

rm -rf "$OUTPUT_DIR"
mkdir -p "$LIB_DIR"
mkdir -p "$HEADERS_DIR"

function create_libclang_for_arch {
  ARCH=$1
  ILD="$INSTALL_DIR/$ARCH/lib/"
  libtool -static -o "$LIB_DIR/libclang-$ARCH.a" \
  	"$ILD/libclang.a" \
  	"$ILD/libclangARCMigrate.a" \
  	"$ILD/libclangAST.a" \
  	"$ILD/libclangASTMatchers.a" \
  	"$ILD/libclangAnalysis.a" \
  	"$ILD/libclangBasic.a" \
  	"$ILD/libclangCodeGen.a" \
  	"$ILD/libclangDriver.a" \
  	"$ILD/libclangDynamicASTMatchers.a" \
  	"$ILD/libclangEdit.a" \
  	"$ILD/libclangFormat.a" \
  	"$ILD/libclangFrontend.a" \
  	"$ILD/libclangFrontendTool.a" \
  	"$ILD/libclangIndex.a" \
  	"$ILD/libclangLex.a" \
  	"$ILD/libclangParse.a" \
  	"$ILD/libclangRewrite.a" \
  	"$ILD/libclangRewriteFrontend.a" \
  	"$ILD/libclangSema.a" \
  	"$ILD/libclangSerialization.a" \
  	"$ILD/libclangStaticAnalyzerCheckers.a" \
  	"$ILD/libclangStaticAnalyzerCore.a" \
  	"$ILD/libclangStaticAnalyzerFrontend.a" \
  	"$ILD/libclangTooling.a" \
  	"$ILD/libclangToolingCore.a" \
  	"$ILD/libLLVMAnalysis.a" \
  	"$ILD/libLLVMSupport.a" \
  	"$ILD/libLLVMInstCombine.a" \
  	"$ILD/libLLVMCore.a" \
  	"$ILD/libLLVMOption.a" \
  	"$ILD/libLLVMBitReader.a" \
  	"$ILD/libLLVMMC.a" \
  	"$ILD/libLLVMMCParser.a"
}

create_libclang_for_arch "arm64"
create_libclang_for_arch "armv7"
create_libclang_for_arch "x86_64"
create_libclang_for_arch "i386"
  
lipo -create "$LIB_DIR/libclang-arm64.a" "$LIB_DIR/libclang-armv7.a" "$LIB_DIR/libclang-i386.a" "$LIB_DIR/libclang-x86_64.a" -output "$LIB_DIR/libclang.a"

cp "$INSTALL_DIR/armv7/include/clang-c/"* "$HEADERS_DIR"

ls -la "$HEADERS_DIR"
lipo -info "$LIB_DIR/libclang.a"


