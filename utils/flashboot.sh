#!/bin/sh
if [ "$1" = "" ]; then
	echo "Please specify device"
	exit
fi
android=~/android/system
fastboot flash boot ${android}/out/target/product/$1/boot.img
fastboot reboot
