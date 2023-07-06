#!/bin/sh 
#
# refresh sxhkd 
#


if [ -z "$XDG_CONFIG_HOME" ]; then
    echo "XDG_CONFIG_HOME is not set, defaulting to ~/.config/sxhkd/"
    sxhkd_path="~/.config/sxhkd/"
else
    sxhkd_path="$XDG_CONFIG_HOME/sxhkd"
fi

cd $sxhkd_path

killall sxhkd
cat bindings/* > .sxhkdrc
cd
setsid sxhkd -c $sxhkd_path/.sxhkdrc > /dev/null 2>&1 &
