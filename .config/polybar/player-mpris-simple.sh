#!/bin/sh

player_status=$(playerctl status 2> /dev/null)
L=16

if [ "$player_status" = "Playing" ]; then
    title=$(playerctl metadata title)
    if [[ ${#title} -gt $L ]]; then
      title="${title:0:L}..."
    else
      title="$title"
    fi
    echo " $(playerctl metadata artist) - $title"
elif [ "$player_status" = "Paused" ]; then
    title=$(playerctl metadata title)
    if [[ ${#title} -gt $L ]]; then
      title="${title:0:L}..."
    else
      title="$title"
    fi
    echo " $(playerctl metadata artist) - $title"
# else
#     echo ""
fi
