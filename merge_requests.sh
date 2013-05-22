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

#http://review.cyanogenmod.org/#/c/38104/
#Revert "Allow brightness decrease when sensor value is zero"
#allows us to use again the lowest brightness with 0 lux
repo download hardware/sony/DASH 38104/1

#http://review.cyanogenmod.org/#/c/38174/
#init: Fix serial number on semc bootloaders
repo download system/core 38174/1
