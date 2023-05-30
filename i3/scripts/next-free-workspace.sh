#!/bin/bash
#
# Selects next free workspace base on monitor scheme
#
# WORKSPACES: 1 2 3  4 5 6  7 8 9  10 11 12  13 14 15  16 17 18 
#            |_____||_____||_____||________||________||________| ...
# MONITORS:    1      2      3        1         2         3   
#

WORKSPACES=$(i3-msg -t get_workspaces | jq -r ".[] | .name")
MONITOR=$(i3-msg -t get_workspaces | jq -r ".[] | select(.focused == true).output")

FORMAT=$1

MONITOR_COUNT=3
GROUP_COUNT=3

case $MONITOR in
    "DP-1") MON_NUM=1;;
    "DP-2") MON_NUM=2;;
    "HDMI-0") MON_NUM=3;;
esac

calc_mon() {
    echo $(normalize $(ceil_div $1 $GROUP_COUNT))
}
 
# (when $GROUP_COUNT = 3)
# input:  1 2 3  4 5 6  7 8 9  10 11 12 ...
# result:   1      2      3       4
ceil_div() {
    echo $(( ($1 + $2 - 1) / $2 ))
}

# (when $MONITOR_COUNT = 3)
# input:  1 2 3 4 5 6 7 8 9 ...
# result: 1 2 3 1 2 3 1 2 3
normalize() {
    echo $(( (($1 - 1) % $MONITOR_COUNT) + 1 ))
}

# i = 0
# loop forever
#   i++
#   if is not occpied && is correct monitor:
#     return i
i=0
while true
do 
    i=$((i + 1))
    if [ -z $(echo "$WORKSPACES" | grep $i) ] && [[ $(calc_mon $i) == $MON_NUM ]]; then
        case $FORMAT in 
            "move") i3-msg "move container to workspace number $i; workspace $i";;
            "goto") i3-msg "workspace $i";;
            "print") echo $i
        esac
        exit
    fi

    # infinite loop limiter, increase if 
    # you want more than 100 monitors
    [[ $i -gt 100 ]] && exit -1
done
