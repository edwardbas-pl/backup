#!/bin/sh

killall -q polybar 

while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done
killall polybar
polybar example &
polybar cos &
polybar main &
killall picom
picom --vsync &




