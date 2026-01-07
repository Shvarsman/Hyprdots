#!/bin/bash

killall -9 waybar
killall -9 swaync
killall -9 nwg-dock-hyprland

waybar &
swaync &
nwg-dock-hyprland -d -i 48 -w 5 -mb 10 -x -nolauncher &
