# !/usr/bin/env sh

yay -S $(grep -v -e "^$\|#" $HOME/.config/package_list)
