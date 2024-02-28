#!/bin/bash

Wall_Set()
{
    if [ -z "$xtrans" ] ; then
        xtrans="grow"
    fi

    swww img "$wallpaper" \
    --transition-bezier .43,1.19,1,.4 \
    --transition-type "$xtrans" \
    --transition-duration 0.7 \
    --transition-fps 60 \
    --invert-y \
    --transition-pos "$( hyprctl cursorpos )"
}

wallpaper="$HOME/Projects/dotfiles/wallpapers/minimal_python.png"


swww query
if [ $? -eq 1 ]; then
    swww init
fi

Wall_Set