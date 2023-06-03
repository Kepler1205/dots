#!/bin/sh

sel=$(vboxmanage list vms | awk '{print $1}' | sed 's|\"||g' | rofi -dmenu)

vboxmanage startvm $sel
