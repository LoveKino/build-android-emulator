#!/bin/bash

source $(cd `dirname $0`;pwd)/base.sh

export CROSS_COMPILE=${AOSP_DIR}/prebuilts/qemu-kernel/kernel-toolchain/android-kernel-toolchain-

export REAL_CROSS_COMPILE=${AOSP_DIR}/prebuilts/gcc/darwin-x86/x86/x86_64-linux-android-4.9/bin/x86_64-linux-android-

export ARCH=x86

export SUBARCH=x86

cd $GOLD_FISH_DIR

make goldfish_defconfig && make
