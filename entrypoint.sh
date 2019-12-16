#!/bin/sh -l

PACKAGE=$1
ALIBUILD_SLUG=$2
ALIDIST_SLUG=$3
DEFAULTS=$4

git clone https://github.com/alisw/alibuild
git clone https://github.com/alisw/alidist

aliBuild build --defaults o2 $PACKAGE
