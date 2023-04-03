#!/bin/bash

theme=echo $CUST_THEMES | rofi -dmenu

~/.config/i3/scripts/change-theme.sh $theme
