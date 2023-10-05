#!/bin/bash

# see man zscroll for documentation of the following parameters
zscroll -l 60 \
        --delay 0.1 \
        --scroll-padding " - " \
	--match-command "`dirname $0`/get_xwindow_name.sh" \
        --update-check true "`dirname $0`/get_xwindow_name.sh" \

wait
