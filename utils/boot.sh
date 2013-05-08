#!/bin/sh
if [ "$1" = "" ]; then
	echo "Please specify device"
	exit
fi
android=~/android/cm10_1
img=${android}/out/target/product/$1/boot.img
echo "Booting ${img} ..."
fastboot boot ${img}
