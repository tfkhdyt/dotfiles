waybar &
gsettings set org.gnome.desktop.interface cursor-theme 'Bibata-Modern-Classic' &
dbus-update-activation-environment --systemd --all &
gammastep -l -6.914744:107.609810 -t 6500:3000 -m wayland &
/usr/lib/polkit-kde-authentication-agent-1 &
foot --server &
sway-audio-idle-inhibit &
swayidle -w timeout 300 'swaylock -f -l --font "JetBrainsMono NFP" -c 000000' timeout 600 'swaymsg "output * power off"' resume 'swaymsg "output * power on"' before-sleep 'swaylock -f -l --font "JetBrainsMono NFP" -c 000000' &
