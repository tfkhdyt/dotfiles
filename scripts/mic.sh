#!/usr/bin/env bash

get_mic_state() {
  pactl get-source-mute @DEFAULT_SOURCE@ | cut -d ' ' -f 2
}

toggle_mic_state() {
  pactl set-source-mute @DEFAULT_SOURCE@ toggle
}

send_notification() {
  dunstify -i audio-input-microphone -r 6666 "$1"
}

MUTE_STATE=$(get_mic_state)

if [ "$MUTE_STATE" = "yes" ]; then
  toggle_mic_state
  send_notification "Mic status [Active]"
elif [ "$MUTE_STATE" = "no" ]; then
  toggle_mic_state
  send_notification "Mic status [Muted]"
else
  echo 'idk'
fi
