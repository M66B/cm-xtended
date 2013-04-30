#!/bin/sh
if [ "$1" = "" ]; then
	echo "Please specify device"
	exit
fi
built=`date +"%Y%m%d"`
if [ "$2" != "" ]; then
	built=$2
fi
android=~/android/system
zip=${android}/out/target/product/$1/cm-10-${built}-UNOFFICIAL-$1.zip
echo "Pushing ${zip} ..."
adb push ${zip} /sdcard/
