#!/bin/bash

To Do:

  * Make this README less crappy...
  * i2c hangs on resume
  * Remove the double tap camera code
  * Power button triggers suspend, but it doesn't suspend

Ubuntu 16.04 Android build host requirements

apt-get install git-core gnupg flex bison gperf build-essential zip curl zlib1g-dev gcc-multilib g++-multilib libc6-dev-i386 lib32ncurses5-dev x11proto-core-dev libx11-dev lib32z-dev ccache libgl1-mesa-dev libxml2-utils xsltproc unzip
apt-get build-dep linux-image-4.4.0-21-generic
apt-get install openjdk-7-jdk
apt-get install python-mako
apt-get install openssh-server vim
apt-get install screen
apt-get install libperformance-dev
apt-get install syslinux-utils
apt-get install squashfs-tools

Check out device_cube_i7, and kernel_cube_i7
put device/cube into android-x86/device
replace android-x86/kernel with kernel_cube_i7

Run run.sh to build...???...profit?

Thanks to wootever @ XDA for the code to fork, and the work to get it to where we are today.

Resizing
-----

DATA IMAGE (2GB)
cd
dd if=/dev/zero of=data.img bs=1k count=2M
mkfs.ext4 data.img

SYSTEM IMAGE (2GB)
cd
unsquashfs android-x86/out/target/product/i7/system.sfs
cd squashfs-root
e2fsck -f system.img
resize2fs system.img 524288

