#!/bin/bash

[[ -f "$XDG_CONFIG_HOME"/X11/xresources ]] && xrdb -merge -I$HOME "$XDG_CONFIG_HOME"/X11/xresources &

# set numlock on by defualt
numlockx on

# bind capslock to escape
setxkbmap -option caps:escape

# apply monitor layout
~/.set-monitors &

export XDG_SESSION_TYPE="x11"

exec i3
