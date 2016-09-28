#!/bin/bash

source $(cd `dirname $0`;pwd)/base.sh

mkdir $AOSP_DIR
cd $AOSP_DIR

# download master
repo init -u https://android.googlesource.com/platform/manifest

repo sync
