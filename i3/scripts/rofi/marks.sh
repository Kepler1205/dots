#!/bin/bash
# 
# Handle marks with rofi
#

show_marks() {
    i3-msg -r -t get_marks \
        | jq -r '.[]' \
        | sed 's|\"||g; s| |\n|g' \
        | rofi -dmenu
}

make_mark() {
    sel=$(show_marks)   

    [ -z $sel ] && exit -1

    # if mark already exists, overwrite it
    if [[ $(grep -F '$sel' < $(i3-msg -r -t get_marks \
        | jq -r '.[]' \
        | sed 's|\"||g; s| |\n|g')) ]]; then

        i3-msg "unmark $sel"
    fi

    i3-msg "mark $sel"
}

goto_mark() {
    sel=$(show_marks)   
    [ -z $sel ] && exit -1
    i3-msg [con_mark="$sel"] focus
}

case $1 in
    "goto") goto_mark && exit ;;
    "make") make_mark && exit ;;
    *) exit -1 ;;
esac
