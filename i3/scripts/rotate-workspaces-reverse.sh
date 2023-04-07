#!/bin/bash
#
#   ----------  ----------  ----------
#   |ws0     |  |ws1     |  |ws2     | 
#   |       ----->      ----->       | 
#   |        |  |        |  |        | 
#   ----^-----  ----------  -----|----
#       |________________________|

# list of visible workspaces on each monitor
VISIBLE_WS=($(i3-msg -t get_workspaces | jq -r ".[] | select(.visible == true).name"))

i3-msg workspace ${VISIBLE_WS[2]}
i3-msg move workspace to output HDMI-0 
i3-msg workspace ${VISIBLE_WS[1]}
i3-msg move workspace to output DP-1
i3-msg workspace ${VISIBLE_WS[0]}
i3-msg move workspace to output DP-2

i3-msg rename workspace ${VISIBLE_WS[1]} to temp
i3-msg rename workspace ${VISIBLE_WS[2]} to ${VISIBLE_WS[1]}
i3-msg rename workspace ${VISIBLE_WS[0]} to temp2
i3-msg rename workspace temp  to ${VISIBLE_WS[0]}
i3-msg rename workspace temp2 to ${VISIBLE_WS[2]}

i3-msg workspace ${VISIBLE_WS[2]}
exit 0
