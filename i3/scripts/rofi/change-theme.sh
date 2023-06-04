#!/bin/bash
cd ~/.config/i3/scripts/rofi
echo $(pwd)
choice=$(cat ../../themes/theme-list \
    | rofi -dmenu -theme-str \
        '#entry {
            placeholder: "Change Theme";
        }'
    )
../change-theme.sh $choice
