#!/usr/bin/env bash

# Dependencies:
# - alsa-utils 
# - dunst 

get_volume() {
  amixer -D pulse get Master | grep '%' | head -n 1 | cut -d '[' -f 2 | cut -d '%' -f 1
}

is_mute() {
  amixer -D pulse get Master | grep '%' | grep -oE '[^ ]+$' | grep off > /dev/null
}

send_notification() {
  iconSound="audio-volume-high"
  iconMuted="audio-volume-muted"
  if is_mute ; then
    dunstify -i $iconSound -r 2593 -u normal -h int:value:0 "Volume [Muted]"
  else
    volume=$(get_volume)
    level=$(echo "int:value:$volume")
    dunstify -i $iconSound -r 2593 -u normal -h $level "Volume [${volume}%]"
  fi
}

case $1 in
  up)
    amixer -D pulse set Master on > /dev/null
    amixer -D pulse sset Master 5%+ > /dev/null
    send_notification
    ;;
  down)
    amixer -D pulse set Master on > /dev/null
    amixer -D pulse sset Master 5%- > /dev/null
    send_notification
    ;;
  mute)
    amixer -D pulse set Master 1+ toggle > /dev/null
    send_notification
    ;;
esac
