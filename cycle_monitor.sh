#!/usr/bin/env bash
# Set the laptop monitor to a lower resolution

EXTERNAL_OUTPUT="DP-3-1"
INTERNAL_OUTPUT="eDP-1"

# if we don't have a file, start at zero
if [ ! -f "/tmp/monitor_mode.dat" ] ; then
  monitor_mode="laptop"

# otherwise read the value from the file
else
  monitor_mode=`cat /tmp/monitor_mode.dat`
fi

if [ $monitor_mode = "laptop" ]; then
    monitor_mode="office"
    xrandr --output $INTERNAL_OUTPUT --scale 1x1 --mode 1360x768 --output $EXTERNAL_OUTPUT --primary --auto --dpi 109 --left-of $INTERNAL_OUTPUT
    sed -i '6s/.*/Xft.dpi: 108/' ~/.Xdefaults
else
    monitor_mode="laptop"
    xrandr --output $INTERNAL_OUTPUT --auto --primary --dpi 209.8 --output $EXTERNAL_OUTPUT --off
    sed -i '6s/.*/Xft.dpi: 170/' ~/.Xdefaults
fi

xrdb -merge ~/.Xdefaults

sleep 1

i3-msg reload
i3-msg restart

echo "${monitor_mode}" > /tmp/monitor_mode.dat
