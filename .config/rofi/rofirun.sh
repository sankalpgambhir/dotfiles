#!/usr/bin/env sh

source "$HOME/.config/rofi/rofiwal.sh"

rofi "${walargs[@]}" -show run -matching fuzzy -width 25
