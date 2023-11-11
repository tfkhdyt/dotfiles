#!/usr/bin/env bash

path="$HOME/Pictures/Screenshots/"
file="Screenshot_$(date +'%Y%m%d_%H%M%S').png"
mode=${1:-save}

if [[ $mode == "save" ]]; then
  grim -o "${path}${file}" &
else
  grim - | wl-copy &
fi

mpv /home/tfkhdyt/audio/camera-shutter-6305.mp3 & wait
