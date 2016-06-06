#!/bin/bash

### Options:
### efi_img
### iso_img
OUTPUT="efi_img"

cd ~/android-x86

. build/envsetup.sh

add_lunch_combo cube_i7-eng
add_lunch_combo cube_i7-userdebug
add_lunch_combo cube_i7-user

lunch cube_i7-userdebug

#Build
m -j 4 ${OUTPUT} 2>&1 | tee ~/build.log

#Build the card reader module
cd ~/android-x86/device/cube/i7/rts5139
make clean 2>&1 | tee -a ~/build.log
make 2>&1 | tee -a ~/build.log

#Integrate GAPPS

#Run the build again
cd ~/android-x86
m -j 4 ${OUTPUT} 2>&1 | tee -a ~/build.log
