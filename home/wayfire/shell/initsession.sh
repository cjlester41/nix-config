#!/usr/bin/env bash

ln -sf ~/.config/wayfire.ini ~/.config/wayfire
sleep 1
wayfire -c ~/.config/wayfire 

# python ~/nix-config/home/wayfire/pywayfire/ipc-rules-demo.py
shaderbg -l 0 HDMI-A-1 ~/nix-config/files/planet.glsl
waybar
blueman-applet
kitty
firefox
code    