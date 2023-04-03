#!/bin/bash

# Change theme script
# $1 = name of theme to change to

isThemeValid=false

echo $1

for i in $(seq 1 $(cat ~/.config/i3/themes/theme-list | wc -l));
do
  if [ "$(cat ~/.config/i3/themes/theme-list | sed -n '$i p')" == $1 ]; then
    isThemeValid=true
    echo break
    break
  fi
done

if [ $isThemeValid = false ]; then
  echo "ERROR: Theme is not in the list of valid themes"
  exit
fi

echo $isThemeValid

echo "Loading $1 theme."

cfg="~/.config"

# ln usage:
# ln -sf /path/to/new_file path/to/symlink

## i3
#ln -sf $cfg/i3/themes/$1.conf $cfg/i3/themes/active-theme.conf
#i3-msg restart
#echo "Loaded i3 $1."
#
## alacritty
#ln -sf $cfg/alacritty/$1.yml $cfg/alacritty/alacritty.yml
#echo "Loaded alacritty $1."
#
## rofi
#ln -sf $cfg/rofi/$1.rasi $cfg/rofi/config.rasi
#echo "Loaded rofi $1."
#
## polybar
#ln -sf $cfg/polybar/themes/$1/config.ini $cfg/polybar/config.ini
#echo "Loaded polybar $1."
#
## conky
#
## dunst
#
## Used in fish config abbreviations
#export CUST_THEME=$1
#
#echo "WARNING: Themed applications that were open before will need to be reopened to have $1 theme applied."
