# i3 Migration to dwm

## Default Mod key

Mod4 (Super key)

## Font

JetBrainsMono Nerd Font

## Screen locker

```
xss-lock --transfer-sleep-lock -- i3lock-fancy
xidlehook
```

## Keybind

### Mic

`/home/tfkhdyt/.dotfiles/scripts/mic.sh`

### Audio Volume

```
/home/tfkhdyt/.dotfiles/scripts/volume.sh up
/home/tfkhdyt/.dotfiles/scripts/volume.sh down
/home/tfkhdyt/.dotfiles/scripts/volume.sh mute
```

### Terminal

`Mod + Return` (st)

### Kill window

`Mod + Shift + q`

### App Launcher

`j4-dmenu-desktop --dmenu="dmenu -fn 'JetBrainsMono Nerd Font-13' -nb '#1e1e2e' -nf '#cdd6f4' -sb '#89dceb' -sf '#1e1e2e' -i -b" --term=st`

### Screenshot

```
~/.config/i3/full-screenshot.sh (Print)
~/.config/i3/active-window-screenshot.sh (Mod + Print)
~/.config/i3/selection-screenshot.sh (Mod + Shift + Print)

maim -u | xclip -selection clipboard -t image/png (Ctrl + Print)
maim -u --window $(xdotool getactivewindow) | xclip -selection clipboard -t image/png (Ctrl + Mod + Print)
maim -u --select | xclip -selection clipboard -t image/png (Ctrl + Shift + Print)

```

### Screen Brightness

```
/home/tfkhdyt/.dotfiles/scripts/brightness.sh up
/home/tfkhdyt/.dotfiles/scripts/brightness.sh down
```

### Passmenu

```
passmenu -fn 'JetBrainsMono Nerd Font-13' -nb '#1e1e2e' -nf '#cdd6f4' -sb '#89dceb' -sf '#1e1e2e' -i -b -p 'Password:'
passotpmenu -fn 'JetBrainsMono Nerd Font-13' -nb '#1e1e2e' -nf '#cdd6f4' -sb '#89dceb' -sf '#1e1e2e' -i -b -p 'OTP:'
```

### powermenu

`powermenu`

### rustyvibes-dmenu

`rustyvibes-dmenu`

## Autostart

### Wallpaper

`feh --no-fehbg --bg-fill --randomize --recursive /home/tfkhdyt/Pictures/Backgrounds/Unsplash/`

### Display Compositor

`picom -b`

### Notification Daemon

`$HOME/.config/dunst/launch.sh`

### polkit auth agent

`/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &`

### Redshift

`redshift -l -6.914744:107.609810 -t 6500:3000`

### Libinput gestures

`libinput-gestures-setup start` (Should adjust to dwm first)

### Udiskie

`udiskie -s`
