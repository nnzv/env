#!/usr/bin/env bash

setxkbmap latam
redshift &
xautolock -time 10 -locker slock -corners +00- -notify 60 -notifier "dunstify -u critical 'xautolock' 'Screen locks in 1m'" &
gentoo-pipewire-launcher &
dbus-launch --binary-syntax ~/bin/bat/main &
exec dbus-launch --exit-with-session dwm

#cvt -r 1920 1080
#xrandr --newmode
#xrandr --addmode DP-2 1920x1080R
#
#xrandr --output DP-2 --same-as eDP-1 --mode 1920x1080 --scale 1x1
#xrandr --output DP-2 --primary
#!/usr/bin/env bash
