#!/bin/bash

[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources &

# set numlock on by defualt
numlockx on &

# bind capslock to escape
setxkbmap -option caps:escape &

# apply monitor layout
~/.set-monitors &

export XDG_SESSION_TYPE="x11"

exec i3
