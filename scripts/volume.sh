#!/usr/bin/env bash

# Dependencies:
# - alsa-utils
# - dunst
# - wireplumber

send_notification() {
  iconSound="audio-volume-high"
  iconMuted="audio-volume-muted"
  VOL=$(wpctl get-volume @DEFAULT_AUDIO_SINK@)

  [ "$VOL" != "${VOL%\[MUTED\]}" ] && dunstify -i $iconMuted -r 2593 -u normal -h int:value:0 "Volume [Muted]" && exit

  volume=$(echo "$VOL" | awk '{printf "%.0f", $2*100}')
  level="int:value:$volume"
  dunstify -i $iconSound -r 2593 -u normal -h "$level" "Volume [${volume}%]"
}

case $1 in
  up)
    amixer -D pulse set Master on > /dev/null
    wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+ > /dev/null
    ;;
  down)
    amixer -D pulse set Master on > /dev/null
    wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%- > /dev/null
    ;;
  mute)
    wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle > /dev/null
    ;;
esac

kill -35 "$(pidof dwmblocks)"
send_notification

