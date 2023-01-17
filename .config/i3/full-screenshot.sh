#!/usr/bin/env bash

path="$HOME/Pictures/Screenshots/"
file="Screenshot_$(date +'%Y%m%d_%H%M%S').png"

maim -u "${path}${file}" && notify-send -i camera-photo 'Screenshot taken!' "File was saved as $file"
