xprop -id $(xdotool getactivewindow) WM_CLASS | cut -d ' ' -f 4 | sed -r s/'\"'//g

