#!/bin/sh

killall -q polybar 

while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

polybar example &
polybar cos &



cd
./.fehbg
wal -R &&


i3 gaps inner all set 15


killall picom
picom &

