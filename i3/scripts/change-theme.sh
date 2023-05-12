#!/bin/bash

# Change theme script
# $1 = name of theme to change to

isThemeValid=false

for i in $(seq 0 $(cat ~/.config/i3/themes/theme-list | wc -l));
do
  if [ "$(cat ~/.config/i3/themes/theme-list | sed -n "$i p")" == $1 ]; then
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

# ln usage:
# ln -sf /path/to/new_file path/to/symlink

# i3
ln -sf ~/.config/i3/themes/$1.conf ~/.config/i3/themes/active-theme.conf
i3-msg restart
echo "Loaded i3 $1."

# alacritty
ln -sf ~/.config/alacritty/$1.yml ~/.config/alacritty/alacritty.yml
echo "Loaded alacritty $1."

# rofi
ln -sf ~/.config/rofi/$1.rasi ~/.config/rofi/config.rasi
echo "Loaded rofi $1."

# polybar
ln -sf ~/.config/polybar/themes/$1/config.ini ~/.config/polybar/config.ini
echo "Loaded polybar $1."

# conky

# dunst

# Used in fish config abbreviations
export THEME=$1

# Individual theme exceptions

if [ $1 == "simple" ]; then
  killall picom
  killall xborders
fi

if [ $1 == "grayscale" ]; then
  killall picom
  killall xborders
fi

if [ $1 == "dracula-purple" ]; then
  xborders &
fi

echo "WARNING: Themed applications that were open before will need to be reopened to have $1 theme applied."
