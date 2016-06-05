Linux Kernel Patches
----

add_rtl8xxxu.patch
  - Adds rtl8xxxu-nextgen branch
  - https://kernel.googlesource.com/pub/scm/linux/kernel/git/jes/linux

drm_perms.patch
  - Removes DRM permission check
  - https://github.com/Wootever/kernel_cube_i7/commit/1ae8968912ebc5f4531af69c12e23ae6d95c1427.patch

exfat-1.2.9.patch
  - Adds support for exfat filesystems
  - https://github.com/Wootever/kernel_cube_i7/commit/6d3477a230ab71e4ef05b6a9affc7c50c9822cef.patch

kionix.patch
  - Adds support for our i2c_hid device
  - https://github.com/Wootever/kernel_cube_i7/commit/c62fea8b0bf472c7575c9b7c18fe236af45306e6.patch

nopic.patch
  - Disable -fpic globally
  - https://github.com/Wootever/kernel_cube_i7/commit/cd9f191bc6256810345def714d93833e885cc21a.patch

rtl8723bu.patch
  - Adds RTL8723BU wireless driver
  - https://github.com/lwfinger/rtl8723bu
  - https://github.com/Wootever/kernel_cube_i7/commit/14e702d38945bc88b7b53554cc492e405633649d.patch

thermal_revert.patch
  - Revert commits https://lkml.org/lkml/2015/12/31/160 and https://lkml.org/lkml/2016/3/19/5
  - Caused immediate kernel panic / reboot loop as the kernel assumed we were always exceeding the
    thresholds.

i2c_reset.patch
  - Corrects a race condition in i2c when resuming from sleep
  - https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?id=9a327405014f4ef4cdad67a0686db82b9f23c62c

i2c_suspend.patch
  - Corrects an issue with i2c suspend and resume
  - https://lkml.org/lkml/diff/2016/3/8/861/1

i2c_async.patch
  - http://www.gossamer-threads.com/lists/linux/kernel/2441848
