#!/bin/sh

function scroll () {
	prefix="$1"
	scrolling="$2"
	temp="$(echo "$scrolling"| sed "s/^\(.\{20\}\)\(.*\)$/\1[\2]/"| sed "s/\[ *\]$//"| sed "s/\[.*\]$//")"
	suffix="$3"
	out="$prefix%{T7}$temp%{T-}$suffix"
	sleep 0.5
	zscroll -l 15 \
        	--delay 0.2 \
		--update-check true "$(echo "$out")" &
} #

function get_artist () {
	echo "$(playerctl -p spotify metadata --format "{{ artist }}"| sed -e "s/[[(]....*[])]*//g" | sed "s/ *$//"| sed "s/^\(.\{20\}[^ ]*\)\(.*\)$/\1[\2]/"| sed "s/\[ *\]$//"| sed "s/\[.*\]$/.../")"
} #

function get_title () {
	echo "$(playerctl -p spotify metadata --format "{{title}}" | sed 's/'\''/\\'\''/g')"
} #

[ ! -z "$(playerctl -p spotify status 2>/dev/null)" ] \
	&& artist=$(get_artist) \
	&& title=$(get_title) \
	&& ([ -z "$artist$title" ] \ 
	&& $(zscroll -l 15 --delay 0.2 "$artist \[ $title \]") \
	|| exit 1
