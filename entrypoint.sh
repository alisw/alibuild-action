#!/bin/sh -l

PACKAGE=$1
ALIBUILD_SLUG=$2
ALIDIST_SLUG=$3
DEFAULTS=$4
EXTRA_PACKAGES=$5

yum install $EXTRA_PACKAGES

git clone https://github.com/alisw/alibuild
git clone https://github.com/alisw/alidist

alibuild/aliBuild doctor --defaults o2 $PACKAGE --debug
alibuild/aliBuild build --defaults o2 $PACKAGE
