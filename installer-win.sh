#!/bin/sh

BUILD_DIR=`pwd`

if [ -f $BUILD_DIR/packages/Gateblu.zip ]; then
  rm $BUILD_DIR/packages/Gateblu.zip
fi

cd $BUILD_DIR/build/Gateblu/win
unzip -q package.nw
rm package.nw
$BUILD_DIR/node_modules/node-webkit-builder/node_modules/.bin/winresourcer --operation=Update --exeFile=Gateblu.exe --resourceType=Icongroup --resourceName=IDR_MAINFRAME --lang=1033 --resourceFile=$BUILD_DIR/icons/gateblu.ico 
zip -rq $BUILD_DIR/packages/Gateblu.zip *

