#!/bin/bash

######## Wallpaper Directory
DIR="/usr/share/wallpapers"
########

PID=$(pgrep gnome-session | xargs | cut -d\  -f1)
export DBUS_SESSION_BUS_ADDRESS=$(grep -z DBUS_SESSION_BUS_ADDRESS /proc/$PID/environ|cut -d= -f2-)
GSETTINGS_BACKEND=dconf

PIC=$(ls $DIR/* | shuf -n1)
gsettings set org.gnome.desktop.background picture-uri "file://$PIC"
