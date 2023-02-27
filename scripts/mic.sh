#!/usr/bin/env bash

toggle_mic_state() {
  wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle
}

send_notification() {
  dunstify -i audio-input-microphone -r 6666 "$1"
}

MUTE=$(wpctl get-volume @DEFAULT_AUDIO_SOURCE@)
if [ "$MUTE" != "${MUTE%\[MUTED\]}" ]; then
  toggle_mic_state
  send_notification "Mic status [Active]"
else
  toggle_mic_state
  send_notification "Mic status [Muted]"
fi

