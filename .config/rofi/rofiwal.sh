#!/usr/bin/env sh

source "$HOME/.cache/wal/colors.sh"

walargs=(-padding 30
	-eh 1.7
     	-font "mononoki Nerd Font 14"
     	-color-window "$background, $background, $color1"
     	-color-normal "$background, $foreground, $background, $color1, $background"
     	-color-active "$background, $foreground, $background, $color1, $background"
)
