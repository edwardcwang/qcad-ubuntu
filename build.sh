#!/bin/bash
set -ex

# Repo setup
git clone --branch v3.30.1.1 --depth 5 https://github.com/qcad/qcad.git

pushd qcad

# Prevent a build error
#Project ERROR: Script bindings not available for Qt version 5.15.13. You can add them to src/3rdparty/qt-labs-qtscriptgenerator-5.15.13 or use another version of Qt.
mkdir -p src/3rdparty/qt-labs-qtscriptgenerator-5.15.13
cp src/3rdparty/qt-labs-qtscriptgenerator-5.15.8/qt-labs-qtscriptgenerator-5.15.8.pro src/3rdparty/qt-labs-qtscriptgenerator-5.15.13/qt-labs-qtscriptgenerator-5.15.13.pro

qmake -r CONFIG+=ractivated

make -j$(nproc) release

popd
