#!/usr/bin/env bash

# target_directory = "/home/cjlester/nix-config/files/shaders"
while true; do
    for file in "$HOME/nix-config/files/shaders"/*; do
        if [ -f "$file" ]; then
        while IFS= read -r line; do
            for (( i=0; i<${#line}; i++ )); do
                printf "%c" "${line:i:1}"
                sleep .001
            done
            printf "\n          " 
        done < "$file"
        fi
    done
done