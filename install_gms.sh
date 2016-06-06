#!/bin/bash

if [ -z "$ANDROID_PRODUCT_OUT" ]; then
  if [ -d out/target/product ]; then
	num=1
	for line in out/target/product/*/system; do
		echo -n "${num} "
		echo $line | cut -d/ -f4
		((num++))
	done
	echo Enter number corresponding to build product or no to enter path manually
	read APOno
	echo 'Next Time please specify product by running "lunch [...]" to set $ANDROID_PRODUCT_OUT variable'
	ANDROID_PRODUCT_OUT=`ls -d out/target/product/ | sed -n ${APOno:-1}p`
	if [ "$APOno" = "no" ]; then
		echo Enter Path to Product Folder
		read ANDROID_PRODUCT_OUT
	fi
  fi
  else 
  echo "cd to root of build folder" 
  #exit 0
fi

gappsdl(){
echo "A gapps.zip wasn't found, so let's download one"
echo "Which package do you want to download: pico, nano, mini, micro, full, stock"
read PACk
echo "Which OS version: 4.4, 5.0, 5.1, 6.0"
read OSv
echo "For which arch: arm, arm64, x86, x86_64"
read ARCh
echo "Attempting to download open_gapps-${ARCh}-${OSv}-${PACk}-`date +%Y%m%d.`.zip"
wget https://github.com/opengapps/${ARCh}/releases/download/`date +%Y%m%d`/open_gapps-${ARCh}-${OSv}-${PACk}-`date +%Y%m%d`.zip
}
pushd $(dirname $0) > /dev/null

echo "1. cleaning up..."

rm -rf tmp/* &> /dev/null
mkdir tmp/ &> /dev/null

echo "2. unpacking gapps archive..."
if ! grep -q *.zip .; then 
   gappsdl
fi
unzip *.zip -d tmp/

echo "3. unpacking individual component archives..."

cd tmp/
mkdir unpacked
find -name '*.tar.lz' | xargs -n 1 tar -px -C unpacked -f &> /dev/null
find -name '*.tar.xz' | xargs -n 1 tar -px -C unpacked -f &> /dev/null

echo "4. setting file permissions to 644..."

find unpacked/ -type f -exec chmod 644 {} +

echo "5. putting folder structure together..."

mkdir combined
find unpacked/ -type f | xargs -n 1 -I@ sh -c 'cd `echo "@" | cut -d/ -f1-3`; file=`echo "@" | cut -d/ -f4-`; rsync -R $file ../../../combined; cd ../../../'

echo "6. copying files into ${ANDROID_PRODUCT_OUT}/system ..."

rsync -avr combined/ ${ANDROID_PRODUCT_OUT}/system

echo "7. removing system.img and system.sfs to force their rebuild"


rm -rf ${ANDROID_PRODUCT_OUT}/obj/PACKAGING/systemimage_intermediates/*
rm -f ${ANDROID_PRODUCT_OUT}/system.sfs
rm -rf ${ANDROID_PRODUCT_OUT}/system/priv-app/GooglePackageInstaller

popd > /dev/null

echo "8. operations complete, please rebuild android"
