#!/bin/bash

# Polybar launcher for grayscale theme

killall polybar
polybar center --config=$HOME/.config/polybar/themes/simple/config.ini &
polybar left   --config=$HOME/.config/polybar/themes/simple/config.ini &
polybar right  --config=$HOME/.config/polybar/themes/simple/config.ini &
