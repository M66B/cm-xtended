#!/bin/bash

if [ "${android}" = "" ]; then
	android=~/android/system
fi

cd ${android}

#http://review.cyanogenmod.org/#/c/32906/
repo download frameworks/av/ 32906/2

#http://review.cyanogenmod.org/#/c/28336/
repo download packages/apps/LegacyCamera 28336/1

#http://review.cyanogenmod.org/#/c/37046/
repo download hardware/qcom/audio-caf 37046/1

#http://review.cyanogenmod.org/#/c/34989/
cd ${android}/hardware/qcom/audio-caf
git fetch http://review.cyanogenmod.org/CyanogenMod/android_hardware_qcom_audio-caf refs/changes/89/34989/7 && git format-patch -1 --stdout FETCH_HEAD | patch -p1

#http://review.cyanogenmod.org/#/c/35964/
cd ${android}/hardware/sony/DASH
git fetch http://review.cyanogenmod.org/CyanogenMod/android_hardware_sony_DASH refs/changes/64/35964/1 && git format-patch -1 --stdout FETCH_HEAD | patch -p1 --reverse

#Temporary fix
#cd ${android}/frameworks/av/
#cat <<EOF | patch -p1
#diff --git a/services/audioflinger/AudioPolicyService.cpp b/services/audioflinger/AudioPolicyService.cpp
#index 7dd46f2..5d1eb77 100644
#--- a/services/audioflinger/AudioPolicyService.cpp
#+++ b/services/audioflinger/AudioPolicyService.cpp
#@@ -1565,9 +1565,9 @@ namespace {
#         stop_tone             : aps_stop_tone,
#         set_voice_volume      : aps_set_voice_volume,
#         move_effects          : aps_move_effects,
#-        load_hw_module        : aps_load_hw_module,
#-        open_output_on_module : aps_open_output_on_module,
#-        open_input_on_module  : aps_open_input_on_module,
#+        //load_hw_module        : aps_load_hw_module,
#+        //open_output_on_module : aps_open_output_on_module,
#+        //open_input_on_module  : aps_open_input_on_module,
#     };
# }; // namespace <unnamed>
# 
#EOF
