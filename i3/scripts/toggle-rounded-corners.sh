#!/bin/bash

if [ $(ps aux | grep xborders | wc -l) -gt 1 ]; then
	killall xborders
	i3-msg "border pixel 2"
	killall picom
	picom --experimental-backends --corner-radius 0 &
else
	killall picom
	picom --experimental-backends & disown
	~/applications/github/xborder/xborders --config ~/.config/xborders/config.json
	i3-msg "border pixel 0"
fi
exit
