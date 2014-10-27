#!/bin/sh

OWD=`pwd`

rm Gateblu-x86.tar.gz Gateblu-x64.tar.gz
cd $OWD/gateblu-ui/build/Gateblu
tar czf $OWD/Gateblu-x86.tar.gz linux32
tar czf $OWD/Gateblu-x64.tar.gz linux64
