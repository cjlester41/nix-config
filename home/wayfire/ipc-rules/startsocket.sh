#!/usr/bin/env bash
set -e
source ~/nix-config/files/.venv/bin/activate && \
python ~/nix-config/home/wayfire/ipc-rules.py && \
deactivate