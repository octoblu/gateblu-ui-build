#!/bin/sh

BUILD_DIR=`pwd`

if [ ! -f Gateblu.dmg ]; then
  echo "You need a Gateblu.dmg in your current dir"
  exit 1
fi

hdiutil attach Gateblu.dmg
cd /Volumes/Gateblu
cp -rfp $BUILD_DIR/build/Gateblu/osx/Gateblu.app .

touch /Volumes/Gateblu/Gateblu.app

cd $BUILD_DIR
bless --folder /Volumes/Gateblu --openfolder /Volumes/Gateblu
sleep 2

hdiutil detach /Volumes/Gateblu
