#!/bin/sh

BUILD_DIR=`pwd`

if [ -f Gateblu-x86.tar.gz ]; then
  rm Gateblu-x86.tar.gz
fi 

if [ -f Gateblu-x64.tar.gz ]; then
  rm Gateblu-x64.tar.gz
fi

cd $BUILD_DIR/build/Gateblu
tar czf $BUILD_DIR/Gateblu-x86.tar.gz linux32
tar czf $BUILD_DIR/Gateblu-x64.tar.gz linux64
