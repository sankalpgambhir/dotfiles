#!/usr/bin/env sh

source "$HOME/.config/rofi/rofiwal.sh"

rofi 	"${walargs[@]}" \
	-show run \
	-matching fuzzy \
	-width 25 \
	-run-shell-command '{terminal} -e "{cmd}"' # run shell commands from rofi
