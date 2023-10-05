#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

# load local env vars
[[ -f ~/.env ]] && . ~/.env

# startx if on tty1
[[ "$(tty)" == "/dev/tty1" ]] && startx
# [[ "$(tty)" == "/dev/tty1" ]] && Hyprland
