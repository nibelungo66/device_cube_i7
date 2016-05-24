#!/bin/bash

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
