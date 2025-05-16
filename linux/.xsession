#!/usr/bin/env rc
builtin . $HOME/.rcrc
setxkbmap latam
redshift &
nitrogen --set-tiled --random $HOME/.local/jpg
exec dbus-launch --sh-syntax --exit-with-session awesome
