#!/bin/bash

CUR_DIR=$(cd `dirname $0`;pwd);

cd $CUR_DIR
cd ../WORKING_DIRECTORY

# -debug
# init
# -kernel /Volumes/androidSpace/goldfish/goldfish/arch/arm/boot/zImage
# -system /Volumes/androidSpace/android_work/out/target/product/generic/system.img
# -ramdisk /Volumes/androidSpace/android_work/out/target/product/generic/ramdisk.img
# -avd firstAvd
# -wipe-data
# -skin WXGA800-7in

./emulator
