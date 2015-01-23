#!/bin/sh

BUILD_DIR=`pwd`

if [ -f $BUILD_DIR/packages/Gateblu.dmg ]; then
  rm -f $BUILD_DIR/packages/Gateblu.dmg
fi

echo "### create keychain"
security create-keychain -p travis mac-build.keychain
security import ./certs/apple.cer -k ~/Library/Keychains/mac-build.keychain -T /usr/bin/codesign
security import ./certs/dist.p12 -k ~/Library/Keychains/mac-build.keychain -P $KEY_PASSWORD -T /usr/bin/codesign

app="$BUILD_DIR/build/Gateblu/osx64/Gateblu.app"
identity="A5D9EE988CEFE25C6D04679D00F9C8C60B63C240"

echo "### signing frameworks"
codesign --force --verify --verbose --keychain ~/Library/Keychains/mac-build.keychain --sign "$identity" "$app/Contents/Frameworks/crash_inspector"
codesign --force --verify --verbose --keychain ~/Library/Keychains/mac-build.keychain --sign "$identity" "$app/Contents/Frameworks/node-webkit Framework.framework/node-webkit Framework.tmp"
codesign --force --verify --verbose --keychain ~/Library/Keychains/mac-build.keychain --sign "$identity" "$app/Contents/Frameworks/node-webkit Framework.framework/node-webkit Framework.TOC"
codesign --force --verify --verbose --keychain ~/Library/Keychains/mac-build.keychain --sign "$identity" "$app/Contents/Frameworks/node-webkit Framework.framework/"
codesign --force --verify --verbose --keychain ~/Library/Keychains/mac-build.keychain --sign "$identity" "$app/Contents/Frameworks/node-webkit Helper EH.app/"
codesign --force --verify --verbose --keychain ~/Library/Keychains/mac-build.keychain --sign "$identity" "$app/Contents/Frameworks/node-webkit Helper NP.app/"
codesign --force --verify --verbose --keychain ~/Library/Keychains/mac-build.keychain --sign "$identity" "$app/Contents/Frameworks/node-webkit Helper.app/"

echo "### signing app"
codesign --force --verify --verbose --keychain ~/Library/Keychains/mac-build.keychain --sign "$identity" "$app"

echo "### verifying signature"
codesign -vvv -d "$app"
# sudo spctl -a -vvvv "$app"

echo "### remove keychain"
security delete-keychain mac-build.keychain

cd $BUILD_DIR
./create-dmg --volname Gateblu --volicon dmg/volume.icns --background dmg/background.png --window-size 512 320 --icon-size 128 --icon Gateblu.app 100 180 --hide-extension Gateblu.app --app-drop-link 400 180 packages/Gateblu.dmg $app
