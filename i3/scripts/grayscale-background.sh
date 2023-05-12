#!/bin/sh

if [ -f ~/.fehbg ]; then
    ~/.fehbg
else
    pgrep $HOME/.config/i3/scripts/grayscale-background.sh && exit
    WALLS_DIR="$HOME/pictures/wallpapers/grayscale/active"
    while true; do
        feh --no-fehbg --bg-fill "$WALLS_DIR/$(ls $WALLS_DIR | sort -R | tail -1)"
        sleep 10m
    done
fi
