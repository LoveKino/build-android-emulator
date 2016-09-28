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

source ./build/envsetup.sh

if [ -f $AOSP_DIR/prebuilts/sdk/tools/jack-admin ]
then
    # install jack server
    $AOSP_DIR/prebuilts/sdk/tools/jack-admin uninstall-server
    cd prebuilts/sdk/tools
    $AOSP_DIR/prebuilts/sdk/tools/jack-admin install-server jack-launcher.jar jack-server-4.9.ALPHA.jar
    cd ../../..
    $AOSP_DIR/prebuilts/sdk/tools/jack-admin start-server
fi

#make clobber
 
# make source
lunch aosp_x86_64-eng
make -j16
