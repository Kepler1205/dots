#!/bin/bash


if [ $1 == "--move" ]; then

WS=$(i3-msg -r -t get_workspaces \
    | jq -r '.[] | .name' \
    | rofi -dmenu -theme-str \
        '#entry {
            placeholder: "Move to a Workspace";
        }'
    )

	i3-msg "workspace $WS"

elif [ $1 == "--move-container" ]; then

WS=$(i3-msg -r -t get_workspaces \
    | jq -r '.[] | .name' \
    | rofi -dmenu -theme-str \
        '#entry {
            placeholder: "Move a Window to a Workspace";
        }'
    )

	i3-msg "move container to workspace $WS; workspace $WS"
fi

