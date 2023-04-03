#!/bin/bash

WS=$(i3-msg -r -t get_workspaces | jq -r '.[] | .name' | rofi -dmenu)

if [ $1 == "--move" ]; then
	i3-msg "workspace $WS"
elif [ $1 == "--move-container" ]; then
	i3-msg "move container to workspace $WS; workspace $WS"
fi

