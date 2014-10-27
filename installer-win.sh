#!/bin/sh

BUILD_DIR=`pwd`

if [ -f $BUILD_DIR/Gateblu.zip ]; then
  rm $BUILD_DIR/Gateblu.zip
fi

cd $BUILD_DIR/build/Gateblu/win
zip -q $BUILD_DIR/Gateblu.zip *
