#!/bin/bash
# Startup application script

clear
echo -n "Do you want to open startup applications [y/n] "
read input

if [ $input == "y" ] || [ $input == "\n" ]; then
  btop

  i3-msg "workspace 1; append_layout $XDG_CONFIG_HOME/i3/layouts/ws1.json"
  pgrep firefox || firefox &

# i3-msg "workspace 2; append_layout $XDG_CONFIG_HOME/i3/layouts/ws2.json"
# pgrep alacritty || alacritty &

  i3-msg "workspace 3; append_layout $XDG_CONFIG_HOME/i3/layouts/ws3.json"
  pgrep steam || steam &

  i3-msg "workspace 9; append_layout $XDG_CONFIG_HOME/i3/layouts/ws9.json"
  pgrep spotify-launcher || spotify-launcher &
else
  clear
  exit
fi
clear
