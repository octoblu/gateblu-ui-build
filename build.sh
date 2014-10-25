BUILD_DIR=`pwd`
ulimit -n 8192
rm -rf gateblu-ui
git clone git@github.com:octoblu/gateblu-ui
cd gateblu-ui
npm install
gulp
cp ../build.js .
cp -r ../assets .
node build
node build

OWD=`pwd`

echo "Unpacking Mac..."
cd $OWD
cd build/Gateblu/osx/Gateblu.app/Contents/Resources/app.nw
mkdir dist
cd dist
tar zxvf $BUILD_DIR/dist/node-v0.10.32-darwin-x64.tar.gz

echo "Copying Windows..."
cd $OWD
cd build/Gateblu/win
mkdir dist
cd dist
cp $BUILD_DIR/dist/node.exe .
unzip $BUILD_DIR/dist/npm-1.4.9.zip


cd $BUILD_DIR
sh dmg.sh


