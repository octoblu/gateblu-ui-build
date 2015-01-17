#!/bin/sh

BUILD_DIR=`pwd`

if [ -f $BUILD_DIR/packages/Gateblu-x86.tar.gz ]; then
  rm $BUILD_DIR/packages/Gateblu-x86.tar.gz
fi 

if [ -f $BUILD_DIR/packages/Gateblu-x64.tar.gz ]; then
  rm $BUILD_DIR/packages/Gateblu-x64.tar.gz
fi

cd $BUILD_DIR/build/Gateblu
mv linux32 Gateblu
tar czf $BUILD_DIR/packages/Gateblu-x86.tar.gz Gateblu
mv Gateblu linux32
mv linux64 Gateblu
tar czf $BUILD_DIR/packages/Gateblu-x64.tar.gz Gateblu
mv Gateblu linux64
