#!/bin/bash

cd ~/pictures/wallpapers/
WALL=$(find -L -type f \
    | sed 's|^./||' \
    | rofi -dmenu -theme-str \
        '#entry {
            placeholder: "Change Background";
        }'
    )
[[ -n $WALL ]] && feh --bg-fill ~/pictures/wallpapers/$WALL
