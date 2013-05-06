#!/bin/sh
if [ "$1" = "" ]; then
	echo "Please specify device"
	exit
fi
android=~/android/system
img=${android}/out/target/product/$1/boot.img
echo "Flashing ${img} ..."
fastboot flash boot ${img}
fastboot reboot
