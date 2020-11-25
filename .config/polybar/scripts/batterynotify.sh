#! /usr/bin/env sh

state=$(upower -i /org/freedesktop/UPower/devices/battery_BAT1 | grep "state" | awk '{print $2}')

case $state in
	discharging)
		timemsg=$(upower -i /org/freedesktop/UPower/devices/battery_BAT1 | grep "time to empty" | awk '{print $4 " " $5}')
		;;

	charging)
		timemsg=$(upower -i /org/freedesktop/UPower/devices/battery_BAT1 | grep "time to full" | awk '{print $4 " " $5}')
		;;
esac

notify-send -a "system" -u LOW \
	"Battery $(upower -i /org/freedesktop/UPower/devices/battery_BAT1 | grep percentage | awk '{print $2}')
	${state^} - $timemsg"
