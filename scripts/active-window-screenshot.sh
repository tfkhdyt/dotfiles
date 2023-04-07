#!/usr/bin/env bash

path="$HOME/Pictures/Screenshots/"
file="Screenshot_$(date +'%Y%m%d_%H%M%S').png"

grimblast -n save active "${path}${file}"
