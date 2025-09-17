#!/usr/bin/env bash

pkill firefox &
# pkill code &
pkill kitty &
pkill python &
pkill waybar &
pkill shaderbg &

ln -sf ~/nix-config/home/wayfire/shell/wfgaming.ini ~/.config/wayfire &
sleep 1 &

steam -bigpicture