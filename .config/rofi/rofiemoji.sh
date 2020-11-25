#!/usr/bin/env sh

source "$HOME/.config/rofi/rofiwal.sh"

elist="$HOME/.config/rofi/emoji-list"

chosen=$(awk '{print $1}' $elist | rofi "${walargs[@]}" -p "Emoji" -matching fuzzy -dmenu -i -width 14 -lines 10)

[[ -z $chosen ]] && exit 1

grep -e "^$chosen[[:space:]]" $elist | awk '{print $2}' | xclip -selection clipboard

xdotool key shift+Insert

exit 0
