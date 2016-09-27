#!/bin/bash

source $(cd `dirname $0`;pwd)/base.sh

# setup cache
export USE_CCACHE=1

cd $AOSP_DIR
if [ $(uname) == "Darwin" ]
then 
    prebuilts/misc/darwin-x86/ccache/ccache -M 50G
else 
    prebuilts/misc/linux-x86/ccache/ccache -M 50G
fi

#make clobber

source ./build/envsetup.sh

# install jack server
if [ $(uname) == "Darwin" ]
then
    jack-admin uninstall-server
    cd prebuilts/sdk/tools
    jack-admin install-server jack-launcher.jar jack-server-4.9.ALPHA.jar
    cd ../../..
    jack-admin start-server
fi

# make source
lunch aosp_x86-eng
make -j16
