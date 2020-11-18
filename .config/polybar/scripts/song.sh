#! /usr/bin/env sh

source $HOME/.cache/wal/colors.sh

function pctl_data {
	echo -e "$(playerctl metadata -f {{$1}})"
}

zscroll "echo $(pctl_data "artist") [$(pctl_data "album")] %{F$color1}$(pctl_data "title")%{F-}" \
	-l 20 \
	-u true \
	-U 0.3

exit 1
