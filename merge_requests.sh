#!/bin/bash

if [ "${android}" = "" ]; then
	android=~/android/system
fi


cd ${android}/system/core
# init: Fix serial number on semc bootloaders
git fetch http://review.cyanogenmod.org/CyanogenMod/android_system_core refs/changes/74/38174/1 && git cherry-pick FETCH_HEAD


cd ${android}/bootable/recovery
# "not enough rainbows, 1 star uninstall"
git fetch http://review.cyanogenmod.org/CyanogenMod/android_bootable_recovery refs/changes/77/36777/3 && git cherry-pick FETCH_HEAD
# Update wipe data option confirmation
git fetch http://review.cyanogenmod.org/CyanogenMod/android_bootable_recovery refs/changes/37/45437/6 && git cherry-pick FETCH_HEAD
# Add sdparted option to partition in ext4 fstype
git fetch http://review.cyanogenmod.org/CyanogenMod/android_bootable_recovery refs/changes/57/45557/2 && git cherry-pick FETCH_HEAD
# Enable partition sdcard when non vfat fstype2 option is used in recovery.fstab
git fetch http://review.cyanogenmod.org/CyanogenMod/android_bootable_recovery refs/changes/58/45558/2 && git cherry-pick FETCH_HEAD
# Fix partition sdcard menu options
git fetch http://review.cyanogenmod.org/CyanogenMod/android_bootable_recovery refs/changes/61/45561/7 && git cherry-pick FETCH_HEAD
