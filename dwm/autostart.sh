#!/bin/sh
wal -R &
slstatus &
sh $HOME/.fehbg
compton &
picom -bcCGfF -o 0.38 -O 200 -I 200 -t 0 -l 0 -r 3 -D2 -m 0.88 &
dwm-status &
xss-lock --transfer-sleep-lock -- betterlockscreen -l &
xinput set-prop "SynPS/2 Synaptics TouchPad" "libinput Tapping Enabled" 1
setxkbmap -layout pl
