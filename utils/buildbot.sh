#!/bin/bash
{
	goofull=N
	goodevices="iyokan mango coconut smultron"
	gootarget=/home/M66B/public_html/test

	echo "Cleanup"
	cd ~/android/system
	if [ "${goofull}" = "Y" ]; then
		for goodevice in ${goodevices}
		do
			echo "-- ${goodevice}"
			rm -R out/target/product/${goodevice}
		done
	fi

	echo "Xtended"
	cd ~/Downloads/cm10-fxp-extended
	git pull
	buildbot=Y
	source ~/Downloads/cm10-fxp-extended/update.sh

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
		rom="$(ls -t1 out/target/product/${goodevice}/cm-10-*-UNOFFICIAL-${goodevice}.zip | head -n1)"
		echo "-- ${rom} --> ${gootarget}/${goodevice}"
		scp -P 2222 ${rom} M66B@upload.goo.im:${gootarget}/${goodevice}/
	done

	echo "Done"
} >~/xtended.log 2>&1
