#!/bin/bash

if [ "${android}" = "" ]; then
	android=~/android/system
fi

cd ${android}

#http://review.cyanogenmod.org/#/c/34989/
#msm7x30: Add support for SEMC FM radio
#Add FM audio routing
repo download hardware/qcom/audio-caf 34989/7

#http://review.cyanogenmod.org/#/c/38174/
#init: Fix serial number on semc bootloaders
repo download system/core 38174/1
