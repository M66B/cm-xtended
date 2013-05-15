#!/bin/bash

if [ "${android}" = "" ]; then
	android=~/android/system
fi

cd ${android}

#http://review.cyanogenmod.org/#/c/32906/
#libstagefright: support for disabling buffer metadata
#Fix camcorder
repo download frameworks/av/ 32906/2

#http://review.cyanogenmod.org/#/c/28336/
#LegacyCamera: Load correct panorama JNI libs
#Fix panorama FC in Legacy Camera
repo download packages/apps/LegacyCamera 28336/1

#http://review.cyanogenmod.org/#/c/34989/
#msm7x30: Add support for SEMC FM radio
#Add FM audio routing
repo download hardware/qcom/audio-caf 34989/7

#http://review.cyanogenmod.org/#/c/35964/
#Allow brightness decrease when sensor value is zero
cd ${android}/hardware/sony/DASH
git fetch http://review.cyanogenmod.org/CyanogenMod/android_hardware_sony_DASH refs/changes/64/35964/1 && git format-patch -1 --stdout FETCH_HEAD | patch -p1 --reverse
