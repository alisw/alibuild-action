#!/bin/sh -l

PACKAGE=$1
ALIBUILD_SLUG=$2
ALIDIST_SLUG=$3
DEFAULTS=$4
EXTRA_PACKAGES=$5
REMOVE_PACKAGES=$6

if [ ! "X$EXTRA_PACKAGES" = X ]; then
  yum install -y $EXTRA_PACKAGES
fi
if [ ! "X$REMOVE_PACKAGES" = X ]; then
  yum remove -y $REMOVE_PACKAGES
fi

echo Checking out code in $PWD
cd ..
git clone https://github.com/alisw/alibuild
git clone https://github.com/alisw/alidist

ls -la

pip3 install -e alibuild

echo Building in in $PWD
aliBuild doctor --defaults o2 $PACKAGE --debug
aliBuild build --defaults o2 $PACKAGE
