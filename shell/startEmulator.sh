#!/bin/bash

source $(cd `dirname $0`;pwd)/base.sh;

cd $AOSP_DIR

# -debug
# init
# -kernel /Volumes/androidSpace/goldfish/goldfish/arch/arm/boot/zImage
# -system /Volumes/androidSpace/android_work/out/target/product/generic/system.img
# -ramdisk /Volumes/androidSpace/android_work/out/target/product/generic/ramdisk.img
# -avd firstAvd
# -wipe-data
# -gpu on

source ./build/envsetup.sh

lunch aosp_x86-eng

emulator
