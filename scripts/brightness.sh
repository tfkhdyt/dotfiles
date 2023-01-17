#!/usr/bin/env bash

function get_brightness {
  brightnessctl -l | grep 'Current brightness' | head -n 1 | xargs | cut -d' ' -f 4 | sed 's/[^0-9]//g'
}

function send_notification {
  icon="preferences-system-brightness-lock"
  brightness=$(get_brightness)
  level=$(echo "int:value:$brightness")
  dunstify -i $icon -r 5555 -u normal -h $level "Brightness [${brightness}%]"
}

case $1 in
  up)
    brightnessctl -e set +5% > /dev/null
    send_notification
    ;;
  down)
    brightnessctl -e set 5%- > /dev/null
    send_notification
    ;;
esac
