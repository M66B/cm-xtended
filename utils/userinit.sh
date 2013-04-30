#!/system/xbin/ash

#chmod 755 /data/local/userinit.sh
#chown root:root /data/local/userinit.sh

mount -o remount,rw /system

#Disable aGPS
sed -i '/ro.ril.def.agps.mode/d' /system/build.prop
sed -i '/ro.ril.def.agps.feature/d' /system/build.prop
echo "ro.ril.def.agps.mode=0" >>/system/build.prop
echo "ro.ril.def.agps.feature=1" >>/system/build.prop
log -p i -t userinit.sh "Disabled aGPS"

#Disable button backlights
sed -i 's/echo 4000 > $dev\/button-backlight\/max_current/echo 1 >> $dev\/button-backlight\/max_current/g' /etc/hw_config.sh
log -p i -t userinit.sh "Disabled button backlights"

#Enable all alerts
sed -i '/ro.cellbroadcast.emergencyids/d' /system/build.prop
echo "ro.cellbroadcast.emergencyids=0-65534" >>/system/build.prop
log -p i -t userinit.sh "Enabled all alerts"

mount -o remount,ro /system

#Wifi scan interval
setprop wifi.supplicant_scan_interval 180
log -p i -t userinit.sh "Modified scan interval"

#sshd
/system/bin/sshd
log -p i -t userinit.sh "Started sshd"
