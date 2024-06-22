# QCAD builds for Ubuntu

**Downloads**: See the releases page https://github.com/edwardcwang/qcad-ubuntu/releases

Quick and dirty QCAD .deb package builds for Ubuntu.

Current supported Ubuntu version: 24.04 Noble

# Instructions

```shell
# Run once to install build tools and deps
./setup.sh

# Grab QCAD source and build
./build.sh

# Build Debian/Ubuntu deb package
./mkpkg.sh
```

# Notes

`make install` doesn't really seem to work for QCAD and we have to manually copy out the files.

The original goal was to use Checkinstall but it got really slow around here as it seems that the check for each file is far too slow/inefficient.

https://github.com/ruxkor/checkinstall/blob/e48e26a/checkinstall#L1753

```
checkinstall --install=no --fstrans=yes --review-control ./install.sh $PWD/qcad
```

# References

* https://www.qcad.org/en/component/content/article/78-qcad/111-qcad-compilation-from-sources
* https://github.com/pixeldexter/qcad-debian
