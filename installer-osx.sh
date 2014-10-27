#!/bin/sh

OWD=`pwd`

if [ ! -f Gateblu.dmg ]; then
  echo "You need a Gateblu.dmg in your current dir"
  exit 1
fi

hdiutil attach Gateblu.dmg
cd /Volumes/Gateblu
cp -rfp $OWD/gateblu-ui/build/Gateblu/osx/Gateblu.app .

touch /Volumes/Gateblu/Gateblu.app

cd $OWD
bless --folder /Volumes/Gateblu --openfolder /Volumes/Gateblu
sleep 2

hdiutil detach /Volumes/Gateblu
