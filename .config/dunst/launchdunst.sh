#!/usr/bin/env sh

#        -lf/nf/cf color
#            Defines the foreground color for low, normal and critical notifications respectively.
# 
#        -lb/nb/cb color
#            Defines the background color for low, normal and critical notifications respectively.
# 
#        -lfr/nfr/cfr color
#            Defines the frame color for low, normal and critical notifications respectively.

[ -f "$HOME/.cache/wal/colors.sh" ] && . "$HOME/.cache/wal/colors.sh"

killall -q dunst

dunst -lf  "${foreground:-#ffffff}" \
      -lb  "${background:-#eeeeee}" \
      -lfr "${color1:-#dddddd}" \
      -nf  "${foreground:-#cccccc}" \
      -nb  "${background:-#bbbbbb}" \
      -nfr "${color1:-#aaaaaa}" \
      -cf  "${background:-#999999}" \
      -cb  "${color4:-#888888}" \
      -cfr "${color3:-#ff0000}" &
