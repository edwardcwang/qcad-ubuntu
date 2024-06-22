#!/bin/bash
# Adapted from https://github.com/pixeldexter/qcad-debian/blob/master/qcad.install
set -ex

QCAD_DIR="$1"
ROOT_PREFIX="$2"

if [ ! -d $QCAD_DIR ]; then
  >&2 echo "$QCAD_DIR is not a directory"
  exit 1
fi

if [ ! -d $ROOT_PREFIX ]; then
  >&2 echo "$ROOT_PREFIX is not a directory"
  exit 1
fi

mkdir -p $ROOT_PREFIX/usr/bin
# For some reason qmake doesn't like it if this is called "qcad.run"
cp qc.run $ROOT_PREFIX/usr/bin/qcad

pushd $QCAD_DIR
mkdir -p $ROOT_PREFIX/usr/lib/qcad
mkdir -p $ROOT_PREFIX/usr/share/qcad

cp release/* $ROOT_PREFIX/usr/lib/qcad/

cp -r fonts/      $ROOT_PREFIX/usr/lib/qcad/
cp -r libraries/  $ROOT_PREFIX/usr/lib/qcad/
cp -r linetypes/  $ROOT_PREFIX/usr/lib/qcad/
cp -r patterns/   $ROOT_PREFIX/usr/lib/qcad/
cp -r plugins/    $ROOT_PREFIX/usr/lib/qcad/
cp -r scripts/    $ROOT_PREFIX/usr/lib/qcad/
cp -r themes/     $ROOT_PREFIX/usr/lib/qcad/
cp -r ts/         $ROOT_PREFIX/usr/lib/qcad/

mkdir -p $ROOT_PREFIX/usr/share/applications
cp qcad.desktop  $ROOT_PREFIX/usr/share/applications/
popd
