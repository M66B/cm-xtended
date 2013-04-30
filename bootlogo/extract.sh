#!/bin/sh

cd "`dirname \"$0\"`"
gcc -O2 -Wall -Wno-unused-parameter -Wno-unused-result -o /tmp/from565 from565.c

android=~/android/system
prebuilt=${android}/device/semc/msm7x30-common/prebuilt
/tmp/from565 -rle <${prebuilt}/logo_M.rle >/tmp/logo_M.raw
convert -depth 8 -size 320x480 rgb:/tmp/logo_M.raw /tmp/logo_M.png

/tmp/from565 -rle <${prebuilt}/logo_H.rle >/tmp/logo_H.raw
convert -depth 8 -size 480x853 rgb:/tmp/logo_H.raw /tmp/logo_H.png
