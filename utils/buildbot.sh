#!/bin/bash
{
	set -e

	goofull=Y
	goodevices="iyokan mango coconut smultron"
	gootarget=/home/M66B/public_html/test

	echo "Cleanup"
	cd ~/android/cm10_1
	if [ "${goofull}" = "Y" ]; then
		for goodevice in ${goodevices}
		do
			echo "-- ${goodevice}"
			rm -R out/target/product/${goodevice}
		done
	fi

	echo "Xtended"
	cd ~/Downloads/cm-xtended
	git pull
	buildbot=Y
	source ~/Downloads/cm-xtended/update.sh

	echo "Environment"
	. build/envsetup.sh

	echo "Build"
	for goodevice in ${goodevices}
	do
		echo "-- ${goodevice}"
		if [ "${full}" = "Y" ]; then
			brunch cm_${goodevice}-userdebug
			mmm external/openssh
		fi
		brunch cm_${goodevice}-userdebug
		rom="$(ls -t1 out/target/product/${goodevice}/cm-10.1-*-UNOFFICIAL-${goodevice}.zip | head -n1)"
		echo "-- ${rom} --> ${gootarget}/${goodevice}"
		scp -P 2222 ${rom} M66B@upload.goo.im:${gootarget}/${goodevice}/
	done

	echo "Done"
} >~/x101.log 2>&1
