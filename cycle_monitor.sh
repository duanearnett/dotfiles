#!/usr/bin/env bash
# Set the laptop monitor to a lower resolution

EXTERNAL_OUTPUT="DP-3-1"
HDMI_OUTPUT="HDMI-1"
INTERNAL_OUTPUT="eDP-1"

monitor_mode=`i3-input -P "Monitor config: " | grep -oP '(?<=command\ =\ )(\w*)'`

# # if we don't have a file, start at zero
# if [ ! -f "/tmp/monitor_mode.dat" ] ; then
#   monitor_mode="laptop"
# # otherwise read the value from the file
# else
#   monitor_mode=`cat /tmp/monitor_mode.dat`
# fi

if [ $monitor_mode = "office" ]; then
    xrandr --output $INTERNAL_OUTPUT \
           --scale 1x1 \
           --mode 1360x768 \
           --output $EXTERNAL_OUTPUT \
           --primary \
           --auto \
           --dpi 109 \
           --left-of $INTERNAL_OUTPUT

    sed -i '6s/.*/Xft.dpi: 108/' ~/.Xdefaults
fi

if [ $monitor_mode = "laptop" ]; then
    xrandr --output $INTERNAL_OUTPUT \
           --auto \
           --primary \
           --dpi 209.8 \
           --output $EXTERNAL_OUTPUT \
           --off

    sed -i '6s/.*/Xft.dpi: 170/' ~/.Xdefaults
fi

if [ $monitor_mode = "home" ]; then
    xrandr --output $INTERNAL_OUTPUT \
           --scale 1x1 \
           --mode 1360x768 \
           --output $HDMI_OUTPUT \
           --mode 1920x1200 \
           --primary \
           --auto \
           --dpi 109 \
           --left-of $INTERNAL_OUTPUT

    sed -i '6s/.*/Xft.dpi: 96/' ~/.Xdefaults
fi

# Reload the config and restart i3...
xrdb -merge ~/.Xdefaults
sleep 1

i3-msg reload
sleep 1

i3-msg restart
sleep 2

# ...Very specific to this setup...
# Reloads the BG images so they fit properly
# after a resolution/DPI change
feh --bg-fill --randomize ~/Pictures/Desktops/*

# Notify what monitor mode we just switched to...
notify-send -u low "Monitor mode changed!" "Monitor set to <b><i>${monitor_mode}</i></b>."

# Store it for no good reason...
echo "${monitor_mode}" > /tmp/monitor_mode.dat
