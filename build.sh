echo "Building node-webkit..."

if [ "$KEY_PASSWORD" == "" ]; then
  echo "KEY_PASSWORD is blank"
  exit 1
fi

BUILD_DIR=`pwd`
NODE_WEBKIT_VERSION=0.11.5
ulimit -n 8192

rm -rf build

echo "Cloning gateblu-ui..."
rm -rf gateblu-ui
git clone git://github.com/octoblu/gateblu-ui
cd gateblu-ui
npm install
node_modules/.bin/gulp
cd $BUILD_DIR

echo "Building node-webkit..."
npm install
node build

rm -rf $BUILD_DIR/packages
mkdir -p $BUILD_DIR/packages

echo "Building Mac..."
cd $BUILD_DIR
cd build/Gateblu/osx64/Gateblu.app/Contents/Resources/app.nw
mkdir dist
tar zxf $BUILD_DIR/dist/node-v0.10.32-darwin-x64.tar.gz --directory dist/

echo "Creating Mac Installer..."
cd $BUILD_DIR
sh installer-osx.sh

echo "Building Windows..."
cd $BUILD_DIR
cd build/Gateblu/win32
mkdir -p dist/node-v0.10.32-win-x86/bin
cp $BUILD_DIR/dist/node-v0.10.32-win-x86/node.exe dist/node-v0.10.32-win-x86/bin
unzip -q $BUILD_DIR/dist/node-v0.10.32-win-x86/npm-1.4.9.zip -d dist/node-v0.10.32-win-x86/bin
mv Gateblu.exe package.nw
cp $BUILD_DIR/cache/$NODE_WEBKIT_VERSION/win32/nw.exe Gateblu.exe

echo "Creating Windows Installer..."
cd $BUILD_DIR
sh installer-win.sh

echo "Building Linux 32-bit..."
cd $BUILD_DIR
cd build/Gateblu/linux32
mkdir dist
tar zxf $BUILD_DIR/dist/node-v0.10.32-linux-x86.tar.gz --directory dist/
LC_CTYPE=C && LANG=C && sed -i '' 's/udev\.so\.0/udev.so.1/g' Gateblu

echo "Building Linux 64-bit..."
cd $BUILD_DIR
cd build/Gateblu/linux64
mkdir dist
tar zxf $BUILD_DIR/dist/node-v0.10.32-linux-x64.tar.gz --directory dist/
LC_CTYPE=C && LANG=C && sed -i '' 's/udev\.so\.0/udev.so.1/g' Gateblu

echo "Creating Linux Installer..."
cd $BUILD_DIR
sh installer-linux.sh


