#!/bin/sh
#
# locks the screen with a
# blurred background image
#

lsc_path="/tmp/lockscreen.png"

# screenshot
scrot $lsc_path
# blur
magick $lsc_path -blur 0x20 $lsc_path
# lock
i3lock -ef --image $lsc_path
rm $lsc_path
