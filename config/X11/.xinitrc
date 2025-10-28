#!/bin/sh

#############################################
# X11 Initialization
#############################################

# Merge Xresources
if [ -f ~/.Xresources ]; then
    xrdb -merge ~/.Xresources
fi

# Set keyboard layout (change to your preference)
setxkbmap -layout us

# Set key repeat rate
xset r rate 300 50

# Disable screen blanking
xset s off
xset -dpms

# Start bspwm
exec bspwm
