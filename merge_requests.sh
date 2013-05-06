#!/bin/bash

if [ "${android}" = "" ]; then
	android=~/android/system
fi

#http://review.cyanogenmod.org/#/c/32906/
cd ${android}/frameworks/av/
git fetch http://review.cyanogenmod.org/CyanogenMod/android_frameworks_av refs/changes/06/32906/2 && git format-patch -1 --stdout FETCH_HEAD | patch -p1

#http://review.cyanogenmod.org/#/c/28336/
cd ${android}/packages/apps/LegacyCamera/
git fetch http://review.cyanogenmod.org/CyanogenMod/android_packages_apps_LegacyCamera refs/changes/36/28336/1 && git format-patch -1 --stdout FETCH_HEAD | patch -p1

#http://review.cyanogenmod.org/#/c/34989/
cd ${android}/hardware/qcom/audio-caf
git fetch http://review.cyanogenmod.org/CyanogenMod/android_hardware_qcom_audio-caf refs/changes/89/34989/5 && git format-patch -1 --stdout FETCH_HEAD | patch -p1

#http://review.cyanogenmod.org/#/c/36772/
cd ${android}/hardware/ti/wpan
git fetch http://review.cyanogenmod.org/CyanogenMod/android_hardware_ti_wpan refs/changes/72/36772/1 && git format-patch -1 --stdout FETCH_HEAD | patch -p1

#http://review.cyanogenmod.org/#/c/35964/
cd ${android}/hardware/sony/DASH
git fetch http://review.cyanogenmod.org/CyanogenMod/android_hardware_sony_DASH refs/changes/64/35964/1 && git format-patch -1 --stdout FETCH_HEAD | patch -p1 --reverse
