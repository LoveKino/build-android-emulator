#!/bin/bash

source $(cd `dirname $0`;pwd)/base.sh

export PATH=$(AOSP_DIR)/prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9/bin:$PATH
export ARCH=x86 
export CROSS_COMPILE=x86_64-linux-android-

cd $GOLD_FISH_DIR

git checkout 3.4

make x86_64_emu_defconfig && make

# The image outputs to the arch/x86/boot/Image directory, the kernel binary outputs to the arch/x86/boot/dts/**/**.dtb. Copy the Image directory and dtb file to the goldfish directory.
