#!/bin/bash
#
#   ----------  ----------
#   |       <---- TARGET |
#   |        |  |        |
#   |CURRENT ---->       |
#   ----------  ----------

CURRENT_WS=$(i3-msg -t get_workspaces | jq -r '.[] | select(.focused==true).name')
CURRENT_WS_OUTPUT=$(i3-msg -t get_tree | jq -r ".. | (.nodes? // empty)[] | select(.focused == true) | .output")
TARGET_WS=$1
TARGET_WS_OUTPUT=$(i3-msg -t get_workspaces | jq -r ".[] | select(.num == $TARGET_WS).output")

if [ $CURRENT_WS == $TARGET_WS ]; then
	exit
fi

i3-msg move workspace to output $TARGET_WS_OUTPUT
i3-msg workspace $TARGET_WS
i3-msg move workspace to output $CURRENT_WS_OUTPUT

i3-msg rename workspace $TARGET_WS to temp
i3-msg rename workspace $CURRENT_WS to $TARGET_WS
i3-msg rename workspace temp to $CURRENT_WS
