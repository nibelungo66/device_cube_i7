Android for Cube i7 Stylus
=========

This is a simple port of Android-x86 that has been massaged to work on the Cube i7 Stylus.  It may or may not be useful for anything else.  Patches welcome, but please don't expect any official support.

WORKING
-----
  * WIFI
  * Bluetooth
  * SD Card Reader
  * Orientation
  * Touch
  * Sleep

BUGGY
-----
  * Resume from sleep is still somewhat glitchy
  * Doze doesn't seem to work, it just goes right to sleep when you press power

PREPARE UBUNTU FOR ANDROID BOOTSTRAP
----

Ubuntu 16.04 Android build host package requirements

    apt-get install git-core gnupg flex bison gperf build-essential zip curl zlib1g-dev gcc-multilib g++-multilib libc6-dev-i386 lib32ncurses5-dev x11proto-core-dev libx11-dev lib32z-dev ccache libgl1-mesa-dev libxml2-utils xsltproc unzip
    apt-get build-dep linux-image-4.4.0-21-generic
    apt-get install openjdk-7-jdk
    apt-get install python-mako
    apt-get install openssh-server vim
    apt-get install screen
    apt-get install libperformance-dev
    apt-get install syslinux-utils
    apt-get install squashfs-tools

QUICK AND DIRTY BUILD STEPS (YMMV)
-----
1. Configure your system as an Android build station
   - http://source.android.com/source/initializing.html

2. Sync the Android x86 sources (currently Marshmallow)
   - http://www.android-x86.org/getsourcecode

3. Check out this project (device_cube_i7)
   - https://github.com/andrewwyatt/device_cube_i7

4. Download the mainline Linux kernel (currently 4.4.11)
   - https://www.kernel.org/pub/linux/kernel/v4.x/

5. Extract and patch the kernel

    for i in ~/android-x86/device/cube/i7/kernel/patches/*patch
    do
      patch -p1 <$i
    done

6. Rename the Marshmallow Android kernel, and put the mainline kernel in its place.

7. Run the build (run.sh)

8. If it's the first run, change to the ~/android-x86/device/cube/i7/rts5139 directory and compile the kernel module

    cd ~/android-x86/device/cube/i7/rts5139
    make clean
    make
9. Run the build again (so the module is injected)

10. ???

11. Profit

Thanks to Wootever and HypoTurtle @ XDA for the code to fork, and the help to get it to where we are today.

DATA IMAGE (2GB)
-----
    cd
    dd if=/dev/zero of=data.img bs=1k count=2M
    mkfs.ext4 data.img

CHANGES
-----
  * Revert commits (double tap camera stuffs)
      5941c98c641e64a26bf68816faf967d25cc8f256
      cc1e9f7ce76d6c1e6d721a398fe8ae8a882243bb

  * Reverse accelerometer (corrects upside down orientation)

  * Enable wakeup for all devices (init.sh)

  * Add SDCard reader kernel module

  * Massage project files

  * Update to mainline kernel 4.4.11
