if [ "$(tty)" = "/dev/tty1" ]; then
  export XDG_CURRENT_DESKTOP=sway
  export QT_QPA_PLATFORM=wayland
  export QT_WAYLAND_DISABLE_WINDOWDECORATION="1"
  sway
fi
