feh --no-fehbg --bg-fill --randomize --recursive /home/tfkhdyt/Pictures/Backgrounds/Unsplash/ &

pidof picom || picom -b &

pidof redshift || redshift -l -6.914744:107.609810 -t 6500:3000 &

pidof slstatus || slstatus &

pkill sxhkd; sxhkd &

pidof xidlehook || xidlehook --detect-sleep --not-when-fullscreen --not-when-audio --timer 1800 'systemctl suspend' ''

pidof xss-lock || xss-lock --transfer-sleep-lock -- slock &
