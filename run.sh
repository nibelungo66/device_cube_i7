#!/bin/bash

### To Do: Make this less crappy...

### Ubuntu 16.04 Android build host requirements

# apt-get install git-core gnupg flex bison gperf build-essential zip curl zlib1g-dev gcc-multilib g++-multilib libc6-dev-i386 lib32ncurses5-dev x11proto-core-dev libx11-dev lib32z-dev ccache libgl1-mesa-dev libxml2-utils xsltproc unzip
# apt-get build-dep linux-image-4.4.0-21-generic
# apt-get install openjdk-7-jdk
# apt-get install python-mako
# apt-get install openssh-server vim
# apt-get install screen
# apt-get install libperformance-dev
# apt-get install syslinux-utils

### Check out device_cube_i7, and kernel_cube_i7
### put device/cube into android-x86/device
### replace android-x86/kernel with kernel_cube_i7

### Run this script to build...???...profit?

### Options:
### efi_img
### usb_iso
### efi_iso
OUTPUT="efi_img"

cd ~/android-x86

. build/envsetup.sh

add_lunch_combo cube_i7-eng
add_lunch_combo cube_i7-userdebug
add_lunch_combo cube_i7-user

lunch cube_i7-userdebug

m -j 4 ${OUTPUT} 2>&1 | tee ~/build.log

### Thanks to wootever @ XDA for the code to fork, and the work to get it to where we are today.

