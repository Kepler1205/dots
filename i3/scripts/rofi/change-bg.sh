#!/bin/bash

WALL_DIR=~/pictures/wallpapers/
cd $WALL_DIR
WALL=$(basename -a $(find -L -type f) \
	| sort \
    | rofi -dmenu -theme-str \
        '#entry {
            placeholder: "Change Background";
        }'
    )
WALL_PATH=$(find -L -type f | grep $WALL)
[[ -n $WALL ]] && feh --bg-fill $WALL_DIR$WALL_PATH
