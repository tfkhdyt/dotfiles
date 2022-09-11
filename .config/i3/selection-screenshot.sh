#!/usr/bin/env bash

path="$HOME/Pictures/Screenshots/"
file="Screenshot_$(date +'%Y%m%d_%H%M%S').png"

maim -u --select "${path}${file}" && notify-send 'Selection Screenshot taken!' "File was saved as $file"
