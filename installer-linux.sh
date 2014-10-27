#!/bin/sh

OWD=`pwd`

cd $OWD/gateblu-ui/build/Gateblu/linux32
tar czvf $OWD/Gateblu-x86.tar.gz *

cd $OWD/gateblu-ui/build/Gateblu/linux64
tar czvf $OWD/Gateblu-x64.tar.gz *
