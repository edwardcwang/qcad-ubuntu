#!/bin/bash

rm -rf debian/tmp && mkdir -p debian/tmp
mkdir -p debian/tmp/DEBIAN

./install.sh $PWD/qcad $PWD/debian/tmp

# See https://stackoverflow.com/a/8077025
# Despite the horrible directory structure, this saves a lot of time in not having to manually enumerate the binary deps.
dpkg-shlibdeps $(find debian/tmp/usr/lib/qcad -name "*.so") debian/tmp/usr/lib/qcad/qcad-bin

# Generate the binary DEBIAN/control for dpkg-deb using the identified deps.
dpkg-gencontrol -v3.30.1.1-unofficial

# Finally build it
dpkg-deb --build debian/tmp
mv debian/tmp.deb qcad.deb
