#!/bin/bash

# list of monitor commands available
commands=("htop" "btop" "top")

# determinate terminal to use
terminal=$(cat "$HOME"/.config/hypr/hyprland.conf | grep ^'$term' | cut -d "=" -f2)

# try to execute every command and start when found one available
for command in "${commands[@]}"; do
    if command -v "$command" @> /dev/null; then
        $terminal -e "$command"
        break
    fi
done