#!/usr/bin/env bash

path="$HOME/Pictures/Screenshots/"
file="Screenshot_$(date +'%Y%m%d_%H%M%S').png"

maim -u --window $(xdotool getactivewindow) "${path}${file}" && notify-send 'Active Window Screenshot taken!' "File was saved as $file"
