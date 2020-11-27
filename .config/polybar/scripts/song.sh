#! /usr/bin/env sh

source $HOME/.cache/wal/colors.sh

function pctl_data {
	echo "$(playerctl metadata -f {{$1}})"
}

function scroll {
	echo "${1:1}${1:0:1}"
}

curtitle=""
var=""
curartist=""

while true
do
	sleep 0.5

	# check if playerctl is still here
	if [ -z $(playerctl status 2> /dev/null) ];
	then
		echo "No player found"
	else

		if ! [ "$curtitle" = "$(pctl_data title)" ];
		then
			# title changed, check and setup again
			curtitle="$(pctl_data title)"

			# if title is too long, set up for looping
			if [ "${#curtitle}" -ge 20 ];
			then
				var="$curtitle - "
			else
				var="$curtitle"
			fi

			curartist="$(pctl_data artist)"

			# if artist name too long, trim and add ellipsis
			if [ "${#curartist}" -ge 15 ];
			then
				curartist="${curartist:0:11}..."
			fi
		fi

		echo "$curartist %{F$color7}%{T7}[ ${var:0:20} ]%{T-}%{F-}"

		if [ "${#curtitle}" -ge 20  ] && ! [ $(playerctl status) = "Paused" ];
		then
			var=$(scroll "$var")
		fi
	fi
done

exit 0
