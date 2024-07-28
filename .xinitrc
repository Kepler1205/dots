#!/bin/bash

[[ -f "$XDG_CONFIG_HOME"/X11/xresources ]] && xrdb -merge -I$HOME "$XDG_CONFIG_HOME"/X11/xresources &

# set numlock on by defualt
numlockx on

# use sxhkd for key bindings
# configs in ~/.config/sxhkd/bindings/
# $XDG_CONFIG_HOME/sxhkd/refresh.sh &

# togle between normal layout and custom variant
setxkbmap -layout "gb,gb" -variant "center_symbol," -option grp:sclk_toggle -option caps:escape

# apply monitor layout
$HOME/.set-monitors &

# turn off screensaver
xset -dpms
xset s off

export XDG_SESSION_TYPE="x11"

exec i3
