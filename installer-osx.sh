#!/bin/sh

BUILD_DIR=`pwd`

rm -f $BUILD_DIR/Gateblu.dmg

app="$BUILD_DIR/build/Gateblu/osx/Gateblu.app"
identity="C5A958791641461665687C1F22275E405BB7D506"

echo "### signing frameworks"
codesign --force --verify --verbose --sign "$identity" "$app/Contents/Frameworks/crash_inspector"
codesign --force --verify --verbose --sign "$identity" "$app/Contents/Frameworks/node-webkit Framework.framework/node-webkit Framework.tmp"
codesign --force --verify --verbose --sign "$identity" "$app/Contents/Frameworks/node-webkit Framework.framework/node-webkit Framework.TOC"
codesign --force --verify --verbose --sign "$identity" "$app/Contents/Frameworks/node-webkit Framework.framework/"
codesign --force --verify --verbose --sign "$identity" "$app/Contents/Frameworks/node-webkit Helper EH.app/"
codesign --force --verify --verbose --sign "$identity" "$app/Contents/Frameworks/node-webkit Helper NP.app/"
codesign --force --verify --verbose --sign "$identity" "$app/Contents/Frameworks/node-webkit Helper.app/"

echo "### signing app"
codesign --force --verify --verbose --sign "$identity" "$app"

echo "### verifying signature"
codesign -vvv -d "$app"
# sudo spctl -a -vvvv "$app"

cd $BUILD_DIR
./create-dmg --volname Gateblu --volicon dmg/volume.icns --background dmg/background.png --window-size 512 320 --icon-size 128 --icon Gateblu.app 100 180 --hide-extension Gateblu.app --app-drop-link 400 180 Gateblu.dmg build/Gateblu/osx/Gateblu.app
