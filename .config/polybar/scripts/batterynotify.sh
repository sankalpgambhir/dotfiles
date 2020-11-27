#! /usr/bin/env sh

state=$(acpi --battery | grep -v Unknown | awk '{print $3 " "  $4 " "  $5}' | sed 's/,//')

notify-send -a "system" -u LOW "$(echo -e Battery\\n$state)"
