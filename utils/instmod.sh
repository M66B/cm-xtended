#!/bin/sh
if [ "$1" = "" ]; then
	echo "Please specify device"
	exit
fi
android=~/android/cm10_1
patches=~/Downloads/cm-xtended
fw=6.3.10.0.136

rm -f ${android}/out/target/product/$1/root/firmware/wl127x-fw-4-sr.bin
rm -f ${android}/out/target/product/$1/root/firmware/wl127x-fw-5-sr.bin
rm -f ${android}/out/target/product/$1/root/firmware/ti-connectivity/wl127x-fw-4-sr.bin
rm -f ${android}/out/target/product/$1/root/firmware/ti-connectivity/wl127x-fw-5-sr.bin
ln -sf /data/etc/wifi/wl127x-fw-5-sr.bin ${android}/out/target/product/$1/root/firmware/wl127x-fw-4-sr.bin
ln -sf /data/etc/wifi/wl127x-fw-5-sr.bin ${android}/out/target/product/$1/root/firmware/wl127x-fw-5-sr.bin
ln -sf /data/etc/wifi/wl127x-fw-5-sr.bin ${android}/out/target/product/$1/root/firmware/ti-connectivity/wl127x-fw-4-sr.bin
ln -sf /data/etc/wifi/wl127x-fw-5-sr.bin ${android}/out/target/product/$1/root/firmware/ti-connectivity/wl127x-fw-5-sr.bin

echo "System read/write"
adb shell su -c 'mount -o remount,rw /system'

echo "Cleanup"
adb shell su -c 'rm -f /data/local/tmp/*.ko'
adb shell su -c 'rm -f /data/local/tmp/*.bin'
adb shell su -c 'rm -f /system/lib/modules/*.ko'
adb shell su -c 'rm -f /data/etc/wifi/*.bin'

mods=${android}/out/target/product/$1/system/lib/modules/*.ko
for mod in $mods; do
	echo "Pushing ${mod} ..."
	adb push ${mod} /data/local/tmp/
done

adb shell su -c 'cp /data/local/tmp/*.ko /system/lib/modules/'

echo "System read only"
adb shell su -c 'mount -o remount,ro /system'

echo "Push firmware ${fw}"
adb push ${patches}/wl127x-fw-4-sr.bin.${fw} /data/local/tmp/wl127x-fw-5-sr.bin
adb shell su -c 'cp /data/local/tmp/*.bin /data/etc/wifi/'

echo "/firmware:"
adb shell su -c 'ls -al /firmware'

echo "/firmware/ti-connectivity:"
adb shell su -c 'ls -al /firmware/ti-connectivity'

echo "/system/lib/modules:"
adb shell ls -al /system/lib/modules

echo "/data/etc/wifi:"
adb shell su -c 'ls -al /data/etc/wifi'
