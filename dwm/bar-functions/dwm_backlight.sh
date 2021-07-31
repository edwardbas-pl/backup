#!/bin/bash

# A dwm_bar module to display the current backlight brighness with xbacklight
# Joe Standring <git@joestandring.com>
# GNU GPLv3

# Dependencies: xbacklight

dwm_backlight () {
	backlight=$(printf "%s☀ %.0f%s\n" "$SEP1" "$(xbacklight)" "$SEP2")
	if [[ $backlight == *outputs* ]]
	then
		printf "%s☀ %.0f%s\n" "$SEP1" "$(xbacklight)" "$SEP2"
	else
		printf ""
	fi
}

dwm_backlight
