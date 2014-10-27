echo "Building node-webkit..."

BUILD_DIR=`pwd`
ulimit -n 8192
rm -rf gateblu-ui
git clone git@github.com:octoblu/gateblu-ui
cd gateblu-ui
npm install
gulp
cd $BUILD_DIR
node build
node build

echo "Building Mac..."
cd $BUILD_DIR
cd build/Gateblu/osx/Gateblu.app/Contents/Resources/app.nw
mkdir dist
tar zxf $BUILD_DIR/dist/node-v0.10.32-darwin-x64.tar.gz --directory dist/

echo "Creating Mac Installer..."
cd $BUILD_DIR
sh installer-osx.sh

echo "Building Windows..."
cd $BUILD_DIR
cd build/Gateblu/win
mkdir dist
cd dist
cp $BUILD_DIR/dist/node.exe .
unzip $BUILD_DIR/dist/npm-1.4.9.zip
cp -rfp $BUILD_DIR/cache/0.11.0-rc1/win/locales build/Gateblu/win

echo "Creating Windows Installer..."
cd $BUILD_DIR
sh installer-win.sh

echo "Building Linux 32-bit..."
cd $BUILD_DIR
cd build/Gateblu/linux32
mkdir dist
tar zxf $BUILD_DIR/dist/node-v0.10.32-linux-x86.tar.gz --directory dist/
LC_CTYPE=C && LANG=C && sed -i '' 's/udev\.so\.0/udev.so.1/g' Gateblu 
cp -rfp $BUILD_DIR/cache/0.11.0-rc1/linux32/locales build/Gateblu/linux32

echo "Building Linux 64-bit..."
cd $BUILD_DIR
cd build/Gateblu/linux64
mkdir dist
tar zxf $BUILD_DIR/dist/node-v0.10.32-linux-x64.tar.gz --directory dist/
LC_CTYPE=C && LANG=C && sed -i '' 's/udev\.so\.0/udev.so.1/g' Gateblu 
cp -rfp $BUILD_DIR/cache/0.11.0-rc1/linux64/locales build/Gateblu/linux64

echo "Creating Linux Installer..."
cd $BUILD_DIR
sh installer-linux.sh


