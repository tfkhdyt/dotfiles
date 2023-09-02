#!/usr/bin/env bash

if pgrep wl-screenrec > /dev/null; then
  PID=$(pgrep wl-screenrec)

  kill -2 "$PID"
  notify-send -i camera-video "Screen recording has ended"
else
  TIMESTAMP=$(date +"%Y%m%d-%H%M%S")
  OUTPUT_DIR="$HOME/Videos/Recordings"
  FILENAME="wl-screenrec-${TIMESTAMP}.mp4"

  mpv --really-quiet "$HOME/audio/ping-82822.mp3"
  wl-screenrec --audio --audio-device 'alsa_output.usb-0600_USBGH8-Plus-7.1-00.analog-stereo.monitor' -b '2 MB' -f "$OUTPUT_DIR/$FILENAME" > /dev/null & disown
fi
