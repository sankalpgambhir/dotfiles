#! /usr/bin/env sh

# terminate polybar if running
killall -q polybar

# let polybar die
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# launch
polybar -r -c ~/.config/polybar/config workspace &
polybar -r -c ~/.config/polybar/config music &
polybar -r -c ~/.config/polybar/config status &
