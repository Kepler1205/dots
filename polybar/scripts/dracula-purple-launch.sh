#!/bin/bash

# Polybar launcher for dracula purple theme

killall polybar
polybar center --config=$HOME/.config/polybar/themes/dracula-purple/config.ini &
polybar left   --config=$HOME/.config/polybar/themes/dracula-purple/config.ini &
polybar right  --config=$HOME/.config/polybar/themes/dracula-purple/config.ini &
