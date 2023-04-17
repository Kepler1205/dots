#!/bin/bash
cd ~/.config/i3/scripts/rofi
echo $(pwd)
choice=$(cat ../../themes/theme-list | rofi -dmenu)
../change-theme.sh $choice
