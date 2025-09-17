#!/usr/bin/env bash

ln -sf ~/.config/wayfire.ini ~/.config/wayfire &
wayfire -c ~/.config/wayfire
# sleep 1 &

# python ~/nix-config/home/wayfire/pywayfire/ipc-rules-demo.py
# shaderbg -l background HDMI-A-1 ~/nix-config/files/shaders/planet.glsl &
# hyprlock
# waybar
# blueman-applet
# kitty
# firefox
# code    