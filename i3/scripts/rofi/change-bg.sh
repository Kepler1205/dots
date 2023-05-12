#!/bin/bash

cd ~/pictures/wallpapers/
WALL=$(find -type f | sed 's|^./||' | rofi -dmenu)
[[ -n $WALL ]] && feh --bg-fill ~/pictures/wallpapers/$WALL
