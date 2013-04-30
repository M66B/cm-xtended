#!/bin/sh
if [ "$1" = "" ]; then
	echo "Please specify device"
	exit
fi
android=~/android/system
fastboot boot ${android}/out/target/product/$1/boot.img
