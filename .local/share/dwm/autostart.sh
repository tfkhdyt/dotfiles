feh --no-fehbg --bg-fill --randomize --recursive /home/tfkhdyt/Pictures/Backgrounds/Unsplash/ &

pkill sxhkd; sxhkd &

pidof dwmblocks || dwmblocks &> /dev/null &

pidof xbanish || xbanish -t 5 &

pidof xss-lock || xss-lock --transfer-sleep-lock -- slock &

pidof xidlehook || xidlehook --detect-sleep --not-when-fullscreen --not-when-audio --timer 1800 'systemctl suspend' '' &

pidof redshift || redshift -l -6.914744:107.609810 -t 6500:3000 &> /dev/null &

pidof picom || picom -b &

