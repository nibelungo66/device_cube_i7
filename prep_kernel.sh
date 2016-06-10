#!/bin/bash

if [ ! ${1} ]
then
  echo "Pass a kernel version, ex 4.4.13"
  exit 1
fi

cd ~/android-x86
rm -rf kernel
wget https://cdn.kernel.org/pub/linux/kernel/v4.x/linux-${1}.tar.xz
tar -cvJf linux-${1}.tar.xz
mv linux-${1} kernel
cd kernel
cp ~/android-x86/device/cube/i7/kernel/cube_x64_defconfig arch/x86/configs/
for i in thermal_revert.patch nopic.patch kionix.patch drm_perms.patch exfat-1.2.9.patch rtl8723bu.patch add_rtl8xxxu.patch rts5139-kernel.patch
do
  patch -p1 <~/android-x86/device/cube/i7/kernel/patches/${i}
done
