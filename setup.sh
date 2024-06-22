#!/bin/bash
set -ex

# For Ubuntu 24.04

# Reference: QCAD instructions
# https://www.qcad.org/en/component/content/article/78-qcad/111-qcad-compilation-from-sources

sudo apt-get update
sudo apt-get install -y build-essential devscripts equivs

# Adapted from https://groups.google.com/g/isar-users/c/XaveflvMs8g
install_cmd="apt-get -y" 
sudo mk-build-deps -t "${install_cmd}" -i -r debian/control
# -r flag is broken for some reason
sudo apt-get remove -y qcad-build-deps || true

# QCAD as of 2024-06 doesn't properly support Qt6 and is unable to load
#sudo apt-get install -y qmake6 qt6-base-dev qt6-webview-dev qt6-svg-dev qt6-tools-dev-tools qt6-documentation-tools qt6-tools-dev qt6-image-formats-plugins
