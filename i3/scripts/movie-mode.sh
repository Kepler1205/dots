#!/bin/bash

movie-mode-enable () {
    # gets all but primary monitor
    monitors=$(xrandr --listmonitors \
        | grep -v '+\*' \
        | awk '{print $4}' \
        | sed '/^\s*$/d')

    for i in ${monitors[@]}
    do 
        xrandr --output $i --off
    done
}

movie-mode-disable() {
    # checks if only 1 monitor is active
    if [[ $(xrandr --listmonitors | sed -e '1d' | wc -l) -eq 1 ]] ; then
        ~/.set-monitors
    else
        return -1
    fi
}

[[ $(movie-mode-disable) -eq -1 ]] || movie-mode-enable
