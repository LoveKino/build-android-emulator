#!/bin/bash

# >= 15.04
sudo apt-get update

sudo apt-get install openjdk-8-jdk

# update the default java version - optional

sudo update-alternatives --config java
sudo update-alternatives --config javac

# required packages

sudo apt-get install git python ccache automake lzop bison gperf build-essential zip curl zlib1g-dev g++-multilib python-networkx libxml2-utils bzip2 libbz2-dev libbz2-1.0 libghc-bzlib-dev squashfs-tools pngcrush schedtool dpkg-dev liblz4-tool make optipng maven

# configure USB Access

wget -S -O - http://source.android.com/source/51-android.rules | sed "s/yuer/$USER/" | sudo tee >/dev/null /etc/udev/rules.d/51-android.rules; sudo udevadm control --reload-rules

