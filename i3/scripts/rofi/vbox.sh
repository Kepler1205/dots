#!/bin/sh

sel=$(vboxmanage list vms \
    | awk '{print $1}' \
    | sed 's|\"||g' \
    | rofi -dmenu -theme-str \
        '#entry {
            placeholder: "Start Virutal Machine";
        }'
    )

vboxmanage startvm $sel
