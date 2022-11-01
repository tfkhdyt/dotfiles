#!/usr/bin/env bash

# Only exported variables can be used within the timer's command.
# export PRIMARY_DISPLAY="$(xrandr | awk '/ primary/{print $1}')"

# xautolock -time 10 -locker "i3lock-fancy -- maim" -detectsleep -corners "00--" -killtime 30 -killer "systemctl suspend"
xidlehook --not-when-fullscreen --not-when-audio --timer 600 'i3lock-fancy -- maim' '' --timer 1800 'systemctl suspend' ''

# # # Run xidlehook
# xidlehook \
#   `# Don't lock when there's a fullscreen application` \
#   --not-when-fullscreen \
#   `# Don't lock when there's audio playing` \
#   --not-when-audio \
#   `# Dim the screen after 60 seconds, undim if user becomes active` \
#   # --timer 600 \
#   #   'xrandr --output "$PRIMARY_DISPLAY" --brightness .1' \
#   #   'xrandr --output "$PRIMARY_DISPLAY" --brightness 1' \
#   `# Undim & lock after 10 more seconds` \
#   # --timer 300 \
#   #   'xrandr --output "$PRIMARY_DISPLAY" --brightness 1; i3lock-fancy -- maim' \
#   #   '' \
#   --timer 600 \
#     'i3lock-fancy -- maim'
#     ''
#   `# Finally, suspend an hour after it locks` \
#    --timer 1800 \
#      'systemctl suspend' \
#      ''

