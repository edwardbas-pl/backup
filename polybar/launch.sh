#!/bin/sh

killall -q polybar 

while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done


#polybar example &
#polybar cos &
polybar main &





i3 gaps inner all set 15
killall picom 
picom --vsync &


#if type "xrandr"; then
#  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
#    MONITOR=$m polybar --reload example &
#  done
#else
#  polybar --reload example &
# fi
