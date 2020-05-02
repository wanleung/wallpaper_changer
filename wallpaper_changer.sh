#!/bin/bash

#    Wallpaper Changer, a script to use change the Gnome3 Wallpaper in crontab
#    Copyright (C) 2020  Wan Leung Wong
#
#    This program is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with this program.  If not, see <https://www.gnu.org/licenses/>.

######## Wallpaper Directory
DIR="/usr/share/wallpapers"
########

PID=$(pgrep gnome-session | xargs | cut -d\  -f1)
export DBUS_SESSION_BUS_ADDRESS=$(grep -z DBUS_SESSION_BUS_ADDRESS /proc/$PID/environ|cut -d= -f2-)
GSETTINGS_BACKEND=dconf

PIC=$(find $DIR -type f -iname \*.jpg -o -iname \*.png | shuf -n1)
gsettings set org.gnome.desktop.background picture-uri "file://$PIC"
