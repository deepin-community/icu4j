#!/bin/sh -e

VERSION=$2
TAR=../icu4j_$VERSION.orig.tar.xz
DIR=icu4j-$VERSION
TAG=$(echo "release-${VERSION}" | sed -re 's,\.,-,g')

echo $TAG
mkdir -p $DIR
wget https://github.com/unicode-org/icu/archive/${TAG}.tar.gz
tar -xf ${TAG}.tar.gz --directory $DIR --strip-components 2 --wildcards '*/icu4j/*'

XZ_OPT=--best tar -c -J -f $TAR $DIR
rm -rf $DIR ../$TAG ${TAG}.tar.gz
