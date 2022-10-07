#!/bin/sh

player_status=$(playerctl status 2> /dev/null)
L=20

if [ "$player_status" == "Playing" ]; then 
    title=$(playerctl metadata title)

    if ! artist=$(playerctl metadata artist 2> /dev/null); then
      if [[ ${#title} -gt 32 ]]; then
        title="${title:0:32}..."
      else
        title="$title"
      fi

      echo " ${title:0:32}"
    else 
      if [[ ${#artist} -gt $L ]]; then
        artist="${artist:0:L}..."
      else
        artist="$artist"
      fi

      if [[ ${#title} -gt $L ]]; then
        title="${title:0:L}..."
      else
        title="$title"
      fi

      echo " $artist - $title"
    fi
elif [ "$player_status" == "Paused" ]; then
    title=$(playerctl metadata title)

    if ! artist=$(playerctl metadata artist 2> /dev/null); then
      if [[ ${#title} -gt 32 ]]; then
        title="${title:0:32}..."
      else
        title="$title"
      fi

      echo " ${title:0:32}"
    else 
      if [[ ${#artist} -gt $L ]]; then
        artist="${artist:0:L}..."
      else
        artist="$artist"
      fi
      
      if [[ ${#title} -gt $L ]]; then
        title="${title:0:L}..."
      else
        title="$title"
      fi

      echo " $artist - $title"
    fi
#     echo ""
fi
