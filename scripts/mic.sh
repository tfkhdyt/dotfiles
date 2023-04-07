#!/usr/bin/env bash

toggle_mic_state() {
  wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle &> /dev/null
}

send_notification() {
  dunstify -i audio-input-microphone -r 6666 "$1"
}

MUTE=$(wpctl get-volume @DEFAULT_AUDIO_SOURCE@)

toggle_mic_state

if [ "$MUTE" != "${MUTE%\[MUTED\]}" ]; then
  send_notification "Mic status [Active]"
else
  send_notification "Mic status [Muted]"
fi

