#!/bin/bash

# Auto start script (launched by i3)
if [ -d /etc/X11/xinit/xinitrc.d ]; then
    for f in /etc/X11/xinit/xinitrc.d/*; do
        [ -x "$f" ] && . "$f"
    done
    unset f
fi

# X Settings
xrdb -load ~/.Xresources
xrandr --output DVI-I-1 --right-of DVI-D-0
compton -b

# Automounting utility
exec devmon --exec-on-drive "xterm && ls -l %f" &

# Set wallpaper
nitrogen --restore &

xflux -z 15201 &

box-sync start &

# Launch panel
/home/william/.config/bspwm/panel/panel.sh &
