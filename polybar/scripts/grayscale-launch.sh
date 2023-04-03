#!/bin/bash

# Polybar launcher for grayscale theme

killall polybar
polybar center --config=$HOME/.config/polybar/themes/grayscale/config.ini &
polybar left   --config=$HOME/.config/polybar/themes/grayscale/config.ini &
polybar right  --config=$HOME/.config/polybar/themes/grayscale/config.ini &
